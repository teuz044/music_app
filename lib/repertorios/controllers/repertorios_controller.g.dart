// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repertorios_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RepertoriosController on RepertoriosControllerBase, Store {
  late final _$_lstRepertoriosAtom =
      Atom(name: 'RepertoriosControllerBase._lstRepertorios', context: context);

  List<RepertorioModel> get lstRepertorios {
    _$_lstRepertoriosAtom.reportRead();
    return super._lstRepertorios;
  }

  @override
  List<RepertorioModel> get _lstRepertorios => lstRepertorios;

  @override
  set _lstRepertorios(List<RepertorioModel> value) {
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

  late final _$isCarregandoAtom =
      Atom(name: 'RepertoriosControllerBase.isCarregando', context: context);

  @override
  bool get isCarregando {
    _$isCarregandoAtom.reportRead();
    return super.isCarregando;
  }

  @override
  set isCarregando(bool value) {
    _$isCarregandoAtom.reportWrite(value, super.isCarregando, () {
      super.isCarregando = value;
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

  late final _$setRepertorioAsyncAction =
      AsyncAction('RepertoriosControllerBase.setRepertorio', context: context);

  @override
  Future<void> setRepertorio() {
    return _$setRepertorioAsyncAction.run(() => super.setRepertorio());
  }

  late final _$getRepertorioPorUserIdAsyncAction = AsyncAction(
      'RepertoriosControllerBase.getRepertorioPorUserId',
      context: context);

  @override
  Future<void> getRepertorioPorUserId() {
    return _$getRepertorioPorUserIdAsyncAction
        .run(() => super.getRepertorioPorUserId());
  }

  late final _$deleteRepertorioAsyncAction = AsyncAction(
      'RepertoriosControllerBase.deleteRepertorio',
      context: context);

  @override
  Future<void> deleteRepertorio() {
    return _$deleteRepertorioAsyncAction.run(() => super.deleteRepertorio());
  }

  late final _$selecionarRepertorioAsyncAction = AsyncAction(
      'RepertoriosControllerBase.selecionarRepertorio',
      context: context);

  @override
  Future<void> selecionarRepertorio(int index) {
    return _$selecionarRepertorioAsyncAction
        .run(() => super.selecionarRepertorio(index));
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
isCarregando: ${isCarregando}
    ''';
  }
}
