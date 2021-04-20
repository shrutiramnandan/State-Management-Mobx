// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colory.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Colory on _Colory, Store {
  final _$cAtom = Atom(name: '_Colory.c');

  @override
  Color get c {
    _$cAtom.reportRead();
    return super.c;
  }

  @override
  set c(Color value) {
    _$cAtom.reportWrite(value, super.c, () {
      super.c = value;
    });
  }

  final _$_ColoryActionController = ActionController(name: '_Colory');

  @override
  void changeColor() {
    final _$actionInfo =
        _$_ColoryActionController.startAction(name: '_Colory.changeColor');
    try {
      return super.changeColor();
    } finally {
      _$_ColoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
c: ${c}
    ''';
  }
}
