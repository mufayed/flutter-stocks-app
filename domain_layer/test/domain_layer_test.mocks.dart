// Mocks generated by Mockito 5.4.4 from annotations
// in domain_layer/test/domain_layer_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:domain_layer/core/result.dart' as _i2;
import 'package:domain_layer/entities/stock_symbol.dart' as _i5;
import 'package:domain_layer/entities/symbol_realtime.dart' as _i6;
import 'package:domain_layer/repositories/symbols_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<T> extends _i1.SmartFake implements _i2.Result<T> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SymbolsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSymbolsRepository extends _i1.Mock implements _i3.SymbolsRepository {
  MockSymbolsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<List<_i5.StockSymbol>>> getStockSymbols() =>
      (super.noSuchMethod(
        Invocation.method(
          #getStockSymbols,
          [],
        ),
        returnValue: _i4.Future<_i2.Result<List<_i5.StockSymbol>>>.value(
            _FakeResult_0<List<_i5.StockSymbol>>(
          this,
          Invocation.method(
            #getStockSymbols,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Result<List<_i5.StockSymbol>>>);

  @override
  _i4.Stream<_i2.Result<_i6.SymbolRealtime>> subscribeToSymbol(
          String? symbol) =>
      (super.noSuchMethod(
        Invocation.method(
          #subscribeToSymbol,
          [symbol],
        ),
        returnValue: _i4.Stream<_i2.Result<_i6.SymbolRealtime>>.empty(),
      ) as _i4.Stream<_i2.Result<_i6.SymbolRealtime>>);

  @override
  void closeWebSocketConnection() => super.noSuchMethod(
        Invocation.method(
          #closeWebSocketConnection,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
