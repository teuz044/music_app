import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/repertorios/models/grupos_musica_model.dart';
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
  final List<String> generosMusicais = [
    'Variados',
    'Rock',
    'Pop',
    'Hip Hop',
    'Eletrônica',
    'Jazz',
    'Clássica',
    'Sertanejo',
    'Funk',
    'Reggae',
    'Blues',
  ];

  final nomeGrupoMusicalEC = TextEditingController();
  final idGrupoMusicalEC = TextEditingController();

  @readonly
  var _lstRepertorios = <GruposMusicaModel>[];

  @readonly
  String _selectedGenre = 'Rock';

  @readonly
  bool _isCarregando = false;

  String errorMessage = '';
  

  @readonly
  var _status = RepertorioStateStatus.initial;

  @action
  Future<void> setGruposMusicais() async {
    try {
      _status = RepertorioStateStatus.loaded;
      await Future<void>.delayed(Duration.zero);
      await _repertoriosRepository.setGruposMusicais(nomeGrupoMusicalEC.text, session.Session.userId);
      await Future.delayed(Duration.zero);
      _status = RepertorioStateStatus.updateScreen;
    } catch (e) {
      print(e.toString());
      _status = RepertorioStateStatus.error;
      throw Exception('Erro ao cadastrar grupo');
    }
  }

  @action
  Future<void> deleteGruposMusicais() async {
    try {
      _status = RepertorioStateStatus.loaded;
      await Future<void>.delayed(Duration.zero);
      await _repertoriosRepository.deleteGruposMusicais(int.tryParse(idGrupoMusicalEC.text)?? 0);
      await Future.delayed(Duration.zero);
      _status = RepertorioStateStatus.updateScreen;
    } catch (e) {
      print(e.toString());
      _status = RepertorioStateStatus.error;
      throw Exception('Erro ao deletar grupo');
    }
  }


  @action
  Future<void> selecionarGrupo(int index) async{
    nomeGrupoMusicalEC.text = _lstRepertorios[index].nmGender.toString(); 
    idGrupoMusicalEC.text = _lstRepertorios[index].cdGender.toString();
  }

  @action
  Future<void> getGruposMusicais() async {
    try {
      _status = RepertorioStateStatus.loaded;
      await Future<void>.delayed(Duration.zero);
      _lstRepertorios = await _repertoriosRepository.getGruposMusicaisPorId();
      _status = RepertorioStateStatus.updateScreen;
    } catch (e) {
      if (_lstRepertorios.isEmpty) {
        _lstRepertorios = [];
      }
      print(e.toString());
       _status = RepertorioStateStatus.error;
      throw Exception('Erro ao buscar grupo');
    }
  }

  @action
  void limparCampos() {
    nomeGrupoMusicalEC.clear();
    idGrupoMusicalEC.clear();
  }
}
