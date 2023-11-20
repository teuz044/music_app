// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adicionar_musicas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdicionarMusicasController on AdicionarMusicasControllerBase, Store {
  late final _$_selectedGenreAtom = Atom(
      name: 'AdicionarMusicasControllerBase._selectedGenre', context: context);

  String get selectedGenre {
    _$_selectedGenreAtom.reportRead();
    return super._selectedGenre;
  }

  @override
  String get _selectedGenre => selectedGenre;

  @override
  set _selectedGenre(String value) {
    _$_selectedGenreAtom.reportWrite(value, super._selectedGenre, () {
      super._selectedGenre = value;
    });
  }

  late final _$_lstMusicasAtom = Atom(
      name: 'AdicionarMusicasControllerBase._lstMusicas', context: context);

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

  late final _$_statusAtom =
      Atom(name: 'AdicionarMusicasControllerBase._status', context: context);

  AdicionarMusicasStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  AdicionarMusicasStateStatus get _status => status;

  @override
  set _status(AdicionarMusicasStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$getMusicasPorIdAsyncAction = AsyncAction(
      'AdicionarMusicasControllerBase.getMusicasPorId',
      context: context);

  @override
  Future<void> getMusicasPorId(int nmMusica) {
    return _$getMusicasPorIdAsyncAction
        .run(() => super.getMusicasPorId(nmMusica));
  }

  late final _$AdicionarMusicasControllerBaseActionController =
      ActionController(
          name: 'AdicionarMusicasControllerBase', context: context);

  @override
  void selecionarGenero(String generoSelecionado) {
    final _$actionInfo = _$AdicionarMusicasControllerBaseActionController
        .startAction(name: 'AdicionarMusicasControllerBase.selecionarGenero');
    try {
      return super.selecionarGenero(generoSelecionado);
    } finally {
      _$AdicionarMusicasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
