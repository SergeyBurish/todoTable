// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppState, Store {
  late final _$valueAsAtom = Atom(name: '_AppState.valueAs', context: context);

  @override
  int get valueAs {
    _$valueAsAtom.reportRead();
    return super.valueAs;
  }

  @override
  set valueAs(int value) {
    _$valueAsAtom.reportWrite(value, super.valueAs, () {
      super.valueAs = value;
    });
  }

  late final _$_AppStateActionController =
      ActionController(name: '_AppState', context: context);

  @override
  void incrementAs() {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.incrementAs');
    try {
      return super.incrementAs();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valueAs: ${valueAs}
    ''';
  }
}
