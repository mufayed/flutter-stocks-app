import 'package:domain_layer/entities/stock_symbol.dart';
import 'package:flutter/material.dart';

import '../symbol_screen.dart';

class SearchFieldWidget extends StatefulWidget {
  final List<StockSymbol> symbolsList;

  const SearchFieldWidget({super.key, required this.symbolsList});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode =
      FocusNode(); // To detect focus changes to show or hide suggestions
  bool _suggestionsListVisible = false;
  List<StockSymbol> _filteredSymbols = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onSearchChanged() {
    // Active filter for the symbols list based on the search key
    setState(() {
      _filteredSymbols = widget.symbolsList
          .where((symbol) => symbol.displaySymbol
              .toLowerCase()
              .contains(_controller.text.toLowerCase()))
          .toList();
      _suggestionsListVisible =
          _filteredSymbols.isNotEmpty && _focusNode.hasFocus;
    });
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _suggestionsListVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white.withOpacity(0.4),
              ),
              hintText: 'Explore',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
            onTap: () {
              setState(() {
                _suggestionsListVisible = true;
              });
            },
          ),
        ),
        if (_suggestionsListVisible)
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 55, // Set the height for the horizontal list
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              itemCount: _filteredSymbols.length,
              itemBuilder: (context, index) {
                final symbol = _filteredSymbols[index];
                return GestureDetector(
                  onTap: () {
                    _controller.text = symbol.displaySymbol;
                    setState(() {
                      _suggestionsListVisible = false;
                    });
                    // if the stock in the top 10 from the main list then its primary stock
                    bool primaryStock = widget.symbolsList
                        .sublist(0, 9)
                        .contains(symbol);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SymbolScreen(symbol: symbol, primaryStock: primaryStock,),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(end: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        symbol.displaySymbol,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _focusNode.removeListener(_onFocusChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
