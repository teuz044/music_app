// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/repertorios/models/repertorio_model.dart';
import 'package:music_app/repertorios/repositories/repertorios_repository.dart';
import '../../core/session/session.dart' as session;
part 'repertorios_controller.g.dart';

class RepertoriosController = RepertoriosControllerBase
    with _$RepertoriosController;


  enum RepertorioStateStatus {
  initial,
  loading,
  loaded,
  error,
  updateScreen,
}

abstract class RepertoriosControllerBase with Store {
  final RepertoriosRepository _repertoriosRepository;
  RepertoriosControllerBase(this._repertoriosRepository);

  final nomeRepertorioEC = TextEditingController();
  final idGrupoMusicalEC = TextEditingController();

  @readonly
  var _lstRepertorios = <RepertorioModel>[];

  @readonly
  String _selectedGenre = 'Rock';

  @observable
  bool isCarregando = false;

  String errorMessage = '';

  @readonly
  var _status = RepertorioStateStatus.initial;

  @action
  Future<void> setRepertorio() async {
    try {
      _status = RepertorioStateStatus.loading;
      await Future.delayed(Duration.zero);
      await _repertoriosRepository.setRepertorio(nomeRepertorioEC.text, session.Session.userId);
      _status = RepertorioStateStatus.updateScreen;
    } catch (e) {
      _status = RepertorioStateStatus.error;
      throw Exception('Erro ao cadastrar repertório');
    }
  }
  @action
  Future<void> getRepertorioPorUserId() async {
    try {
      _status = RepertorioStateStatus.loading;
       await Future.delayed(Duration.zero);
      _lstRepertorios = await _repertoriosRepository.getRepertorioPorUserId(session.Session.userId);
      _status = RepertorioStateStatus.updateScreen;
    } catch  (e) {
      if (_lstRepertorios.isEmpty) {
        _lstRepertorios = [];
      }
       _status = RepertorioStateStatus.error;
      throw Exception('Erro ao buscar grupo');
    }
  }

  @action
  Future<void> deleteRepertorio() async {
    try {
      _status = RepertorioStateStatus.loading;
      await Future.delayed(Duration.zero);
      await _repertoriosRepository.deleteRepertorio(int.tryParse(idGrupoMusicalEC.text)?? 0);
      _status = RepertorioStateStatus.updateScreen;
    } catch (e) {
      _status = RepertorioStateStatus.error;
      throw Exception('Erro ao deletar repertório');
    }
  }


  @action
  Future<void> selecionarRepertorio(int index) async{
    nomeRepertorioEC.text = _lstRepertorios[index].nmRepertoire.toString(); 
    idGrupoMusicalEC.text = _lstRepertorios[index].cdRepertoire.toString();
  }


  @action
  void limparCampos() {
    nomeRepertorioEC.clear();
    idGrupoMusicalEC.clear();
  }
}
