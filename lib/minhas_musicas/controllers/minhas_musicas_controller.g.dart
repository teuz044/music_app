// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minhas_musicas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MinhasMusicasController on MinhasMusicasControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'MinhasMusicasControllerBase._status', context: context);

  MinhasMusicasStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  MinhasMusicasStateStatus get _status => status;

  @override
  set _status(MinhasMusicasStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_lstMusicasAtom =
      Atom(name: 'MinhasMusicasControllerBase._lstMusicas', context: context);

  List<MusicModel> get lstMusicas {
    _$_lstMusicasAtom.reportRead();
    return super._lstMusicas;
  }

  @override
  List<MusicModel> get _lstMusicas => lstMusicas;

  @override
  set _lstMusicas(List<MusicModel> value) {
    _$_lstMusicasAtom.reportWrite(value, super._lstMusicas, () {
      super._lstMusicas = value;
    });
  }

  late final _$getMusicasPorIdUserAsyncAction = AsyncAction(
      'MinhasMusicasControllerBase.getMusicasPorIdUser',
      context: context);

  @override
  Future<void> getMusicasPorIdUser() {
    return _$getMusicasPorIdUserAsyncAction
        .run(() => super.getMusicasPorIdUser());
  }

  late final _$adicionarMusicaAsyncAction = AsyncAction(
      'MinhasMusicasControllerBase.adicionarMusica',
      context: context);

  @override
  Future<void> adicionarMusica() {
    return _$adicionarMusicaAsyncAction.run(() => super.adicionarMusica());
  }

  late final _$deleteMusicaAsyncAction =
      AsyncAction('MinhasMusicasControllerBase.deleteMusica', context: context);

  @override
  Future<void> deleteMusica() {
    return _$deleteMusicaAsyncAction.run(() => super.deleteMusica());
  }

  late final _$MinhasMusicasControllerBaseActionController =
      ActionController(name: 'MinhasMusicasControllerBase', context: context);

  @override
  void selecionarMusica(int index) {
    final _$actionInfo = _$MinhasMusicasControllerBaseActionController
        .startAction(name: 'MinhasMusicasControllerBase.selecionarMusica');
    try {
      return super.selecionarMusica(index);
    } finally {
      _$MinhasMusicasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limparCampos() {
    final _$actionInfo = _$MinhasMusicasControllerBaseActionController
        .startAction(name: 'MinhasMusicasControllerBase.limparCampos');
    try {
      return super.limparCampos();
    } finally {
      _$MinhasMusicasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
