// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repertorios_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RepertoriosController on RepertoriosControllerBase, Store {
  late final _$_lstRepertoriosAtom =
      Atom(name: 'RepertoriosControllerBase._lstRepertorios', context: context);

  List<GruposMusicaModel> get lstRepertorios {
    _$_lstRepertoriosAtom.reportRead();
    return super._lstRepertorios;
  }

  @override
  List<GruposMusicaModel> get _lstRepertorios => lstRepertorios;

  @override
  set _lstRepertorios(List<GruposMusicaModel> value) {
    _$_lstRepertoriosAtom.reportWrite(value, super._lstRepertorios, () {
      super._lstRepertorios = value;
    });
  }

  late final _$_selectedGenreAtom =
      Atom(name: 'RepertoriosControllerBase._selectedGenre', context: context);

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

  late final _$_isCarregandoAtom =
      Atom(name: 'RepertoriosControllerBase._isCarregando', context: context);

  bool get isCarregando {
    _$_isCarregandoAtom.reportRead();
    return super._isCarregando;
  }

  @override
  bool get _isCarregando => isCarregando;

  @override
  set _isCarregando(bool value) {
    _$_isCarregandoAtom.reportWrite(value, super._isCarregando, () {
      super._isCarregando = value;
    });
  }

  late final _$_statusAtom =
      Atom(name: 'RepertoriosControllerBase._status', context: context);

  RepertorioStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  RepertorioStateStatus get _status => status;

  @override
  set _status(RepertorioStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$setGruposMusicaisAsyncAction = AsyncAction(
      'RepertoriosControllerBase.setGruposMusicais',
      context: context);

  @override
  Future<void> setGruposMusicais() {
    return _$setGruposMusicaisAsyncAction.run(() => super.setGruposMusicais());
  }

  late final _$deleteGruposMusicaisAsyncAction = AsyncAction(
      'RepertoriosControllerBase.deleteGruposMusicais',
      context: context);

  @override
  Future<void> deleteGruposMusicais() {
    return _$deleteGruposMusicaisAsyncAction
        .run(() => super.deleteGruposMusicais());
  }

  late final _$selecionarGrupoAsyncAction = AsyncAction(
      'RepertoriosControllerBase.selecionarGrupo',
      context: context);

  @override
  Future<void> selecionarGrupo(int index) {
    return _$selecionarGrupoAsyncAction.run(() => super.selecionarGrupo(index));
  }

  late final _$getGruposMusicaisAsyncAction = AsyncAction(
      'RepertoriosControllerBase.getGruposMusicais',
      context: context);

  @override
  Future<void> getGruposMusicais() {
    return _$getGruposMusicaisAsyncAction.run(() => super.getGruposMusicais());
  }

  late final _$RepertoriosControllerBaseActionController =
      ActionController(name: 'RepertoriosControllerBase', context: context);

  @override
  void limparCampos() {
    final _$actionInfo = _$RepertoriosControllerBaseActionController
        .startAction(name: 'RepertoriosControllerBase.limparCampos');
    try {
      return super.limparCampos();
    } finally {
      _$RepertoriosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
