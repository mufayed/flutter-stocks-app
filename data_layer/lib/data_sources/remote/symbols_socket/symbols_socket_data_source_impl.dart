import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:data_layer/data_sources/remote/symbols_socket/symbols_socket_data_source.dart';
import 'package:data_layer/models/symbol_realtime/symbol_realtime_model.dart';
import 'package:domain_layer/core/result.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SymbolsSocketDataSourceImpl implements SymbolsSocketDataSource {
  WebSocketChannel? _channel; // Channel to allow reconnection
  bool _isConnected =
      false; //  Track the connection status to avoid multiple initializations

  final String apiToken;

  // Map to store the controllers for each symbol
  final Map<String, StreamController<Result<SymbolRealTimeModel>>>
      _symbolControllers = {};

  SymbolsSocketDataSourceImpl({required this.apiToken});

  // Initialize the WebSocket connection
  Future<void> _initializeConnection() async {
    if (!_isConnected) {
      _channel = WebSocketChannel.connect(
        Uri.parse('wss://ws.finnhub.io/?token=$apiToken'),
      );
      _isConnected = true;
      log('WebSocket connection opened');

      // Listen to the stream and parse the data
      _channel!.stream.listen((data) {
        final jsonData = json.decode(data);

        log('WebSocket data: $jsonData');

        // Check if the data is a trade and parse it
        if (jsonData['type'] == 'trade' && jsonData['data'] != null) {
          // dynamic is a json object
          final List<dynamic> trades = jsonData['data'];

          for (final tradeData in trades) {
            try {
              final stockRealTimeModel =
                  SymbolRealTimeModel.fromJson(tradeData);
              final symbol = stockRealTimeModel.s;

              // If there is a controller for the symbol, broadcast the result
              if (_symbolControllers.containsKey(symbol)) {
                _symbolControllers[symbol]!
                    .add(Result.success(stockRealTimeModel));
              }
            } catch (e) {
              log('Error parsing trade data: $e');
            }
          }
        }
      }, onError: (error) {
        log('WebSocket error: $error');
        _isConnected = false;
        _channel = null;
      }, onDone: () {
        log('WebSocket connection closed');
        _isConnected = false;
        _channel = null;
      });
    }
  }

  @override
  Stream<Result<SymbolRealTimeModel>> subscribeToSymbol(String symbol) {
    // Check if the symbol is already subscribed to avoid duplicates
    if (!_symbolControllers.containsKey(symbol)) {
      // Initialize the connection if it's not already open
      _initializeConnection();

      // Create a controller for the new symbol
      _symbolControllers[symbol] =
          StreamController<Result<SymbolRealTimeModel>>.broadcast();

      // Subscribe to the symbol
      final subscribeMessage = json.encode({
        'type': 'subscribe',
        'symbol': symbol,
      });
      _channel?.sink.add(subscribeMessage);
      log('Subscribed to symbol: $symbol');
    }
    // Return the stream of the controller
    return _symbolControllers[symbol]!.stream;
  }

  @override
  void unsubscribeFromSymbol(String symbol) {
    // Unsubscribe from a single symbol and close the controller of the symbol
    if (_symbolControllers.containsKey(symbol)) {
      final unsubscribeMessage = json.encode({
        'type': 'unsubscribe',
        'symbol': symbol,
      });
      _channel?.sink.add(unsubscribeMessage);
      _symbolControllers[symbol]?.close();
      _symbolControllers.remove(symbol);
      log('Unsubscribed from symbol: $symbol');
    }
  }

  @override
  void closeConnection() {
    // Close all controllers and the WebSocket connection
    for (var controller in _symbolControllers.values) {
      controller.close();
    }
    _channel?.sink.close();
    _channel = null;
    _isConnected = false;
    log('WebSocket connection closed');
  }


  int _reconnectAttempts = 0;
  Future<void> _reconnect() async {
    if (_reconnectAttempts < 5) {
      await Future.delayed(Duration(seconds: 2 * _reconnectAttempts));
      _reconnectAttempts++;
      await _initializeConnection();
    } else {
      log('Max reconnection attempts reached');
    }
  }
}
