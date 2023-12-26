// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musicas_vinculadas_bloco_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MusicasVinculadasBlocoController
    on MusicasVinculadasBlocoControllerBase, Store {
  late final _$_statusAtom = Atom(
      name: 'MusicasVinculadasBlocoControllerBase._status', context: context);

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

  late final _$_lstMusicasDoBlocoMusicalAtom = Atom(
      name: 'MusicasVinculadasBlocoControllerBase._lstMusicasDoBlocoMusical',
      context: context);

  List<MinhasMusicasModel> get lstMusicasDoBlocoMusical {
    _$_lstMusicasDoBlocoMusicalAtom.reportRead();
    return super._lstMusicasDoBlocoMusical;
  }

  @override
  List<MinhasMusicasModel> get _lstMusicasDoBlocoMusical =>
      lstMusicasDoBlocoMusical;

  @override
  set _lstMusicasDoBlocoMusical(List<MinhasMusicasModel> value) {
    _$_lstMusicasDoBlocoMusicalAtom
        .reportWrite(value, super._lstMusicasDoBlocoMusical, () {
      super._lstMusicasDoBlocoMusical = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
