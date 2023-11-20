// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criar_nova_musica_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CriarNovaMusicaController on CriarNovaMusicaControllerBase, Store {
  late final _$_selectedGenreAtom = Atom(
      name: 'CriarNovaMusicaControllerBase._selectedGenre', context: context);

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

  late final _$_statusAtom =
      Atom(name: 'CriarNovaMusicaControllerBase._status', context: context);

  CriarMusicaStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  CriarMusicaStateStatus get _status => status;

  @override
  set _status(CriarMusicaStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$adicionarMusicaAsyncAction = AsyncAction(
      'CriarNovaMusicaControllerBase.adicionarMusica',
      context: context);

  @override
  Future<void> adicionarMusica(int cdGrupo) {
    return _$adicionarMusicaAsyncAction
        .run(() => super.adicionarMusica(cdGrupo));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
