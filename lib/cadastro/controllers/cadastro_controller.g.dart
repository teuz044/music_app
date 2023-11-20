// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastroController on CadastroControllerBase, Store {
  late final _$_errorMessageAtom =
      Atom(name: 'CadastroControllerBase._errorMessage', context: context);

  String get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String get _errorMessage => errorMessage;

  @override
  set _errorMessage(String value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_carregandoAtom =
      Atom(name: 'CadastroControllerBase._carregando', context: context);

  bool get carregando {
    _$_carregandoAtom.reportRead();
    return super._carregando;
  }

  @override
  bool get _carregando => carregando;

  @override
  set _carregando(bool value) {
    _$_carregandoAtom.reportWrite(value, super._carregando, () {
      super._carregando = value;
    });
  }

  late final _$registroAsyncAction =
      AsyncAction('CadastroControllerBase.registro', context: context);

  @override
  Future<bool> registro() {
    return _$registroAsyncAction.run(() => super.registro());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
