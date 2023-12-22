// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocos_musicas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BlocosMusicasController on BlocosMusicasControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'BlocosMusicasControllerBase._status', context: context);

  BlocosMusicasStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  BlocosMusicasStateStatus get _status => status;

  @override
  set _status(BlocosMusicasStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_lstBlocosMusicaisAtom = Atom(
      name: 'BlocosMusicasControllerBase._lstBlocosMusicais', context: context);

  List<BlocoMusicasModel> get lstBlocosMusicais {
    _$_lstBlocosMusicaisAtom.reportRead();
    return super._lstBlocosMusicais;
  }

  @override
  List<BlocoMusicasModel> get _lstBlocosMusicais => lstBlocosMusicais;

  @override
  set _lstBlocosMusicais(List<BlocoMusicasModel> value) {
    _$_lstBlocosMusicaisAtom.reportWrite(value, super._lstBlocosMusicais, () {
      super._lstBlocosMusicais = value;
    });
  }

  late final _$_lstBlocosMusicaisFilterPorRepertorioIdAtom = Atom(
      name:
          'BlocosMusicasControllerBase._lstBlocosMusicaisFilterPorRepertorioId',
      context: context);

  List<BlocoMusicasModel> get lstBlocosMusicaisFilterPorRepertorioId {
    _$_lstBlocosMusicaisFilterPorRepertorioIdAtom.reportRead();
    return super._lstBlocosMusicaisFilterPorRepertorioId;
  }

  @override
  List<BlocoMusicasModel> get _lstBlocosMusicaisFilterPorRepertorioId =>
      lstBlocosMusicaisFilterPorRepertorioId;

  @override
  set _lstBlocosMusicaisFilterPorRepertorioId(List<BlocoMusicasModel> value) {
    _$_lstBlocosMusicaisFilterPorRepertorioIdAtom
        .reportWrite(value, super._lstBlocosMusicaisFilterPorRepertorioId, () {
      super._lstBlocosMusicaisFilterPorRepertorioId = value;
    });
  }

  late final _$setBlocoMusicalAsyncAction = AsyncAction(
      'BlocosMusicasControllerBase.setBlocoMusical',
      context: context);

  @override
  Future<void> setBlocoMusical(int repertorioId) {
    return _$setBlocoMusicalAsyncAction
        .run(() => super.setBlocoMusical(repertorioId));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
