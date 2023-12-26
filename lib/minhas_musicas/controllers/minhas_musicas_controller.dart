import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/minhas_musicas/repositories/minhas_musicas_repository.dart';
import '../../core/session/session.dart' as session;
import '../models/music_model.dart';
part 'minhas_musicas_controller.g.dart';

class MinhasMusicasController = MinhasMusicasControllerBase with _$MinhasMusicasController;

enum MinhasMusicasStateStatus {
  initial,
  loading,
  loaded,
  error,
  updateScreen,
}


abstract class MinhasMusicasControllerBase with Store {
  final MinhasMusicasRepository _minhasMusicasRepository;

@readonly
  var _status = MinhasMusicasStateStatus.initial;

@readonly
var _lstMusicas = <MusicModel>[];

final nomeMusicaEC = TextEditingController();
final letraMusicaEC = TextEditingController();
final compositorEC = TextEditingController();
final cdMusicEC = TextEditingController();
final formKey = GlobalKey<FormState>();

  MinhasMusicasControllerBase(this._minhasMusicasRepository);

  @action
  Future<void> getMusicasPorIdUser() async {
    try {
      _status = MinhasMusicasStateStatus.loading;
      _lstMusicas = await _minhasMusicasRepository.getMusicasPorIdUser(session.Session.userId);
      await Future.delayed(Duration.zero);
      _status = MinhasMusicasStateStatus.updateScreen;
    } catch (e) {
      if (_lstMusicas.isEmpty) {
        _lstMusicas = [];
      }
      print(e.toString());
      _status = MinhasMusicasStateStatus.error;
      throw Exception('Erro ao buscar musicas');
    }
  }

  @action
  Future<void> adicionarMusica() async {
    try {
      _status = MinhasMusicasStateStatus.loading;
      await Future.delayed(Duration.zero);
      await _minhasMusicasRepository.adicionarMusica(nomeMusicaEC.text, session.Session.userId, letraMusicaEC.text, compositorEC.text);
      _status = MinhasMusicasStateStatus.updateScreen;
    } catch (e) {
      print(e.toString());
      _status = MinhasMusicasStateStatus.error;
      throw Exception('Erro ao cadastrar música');
    }
  }

  @action
  void selecionarMusica(int index) {
     nomeMusicaEC.text = _lstMusicas[index].nmMusic ?? '';
     letraMusicaEC.text = _lstMusicas[index].letterMusic ?? '';
     compositorEC.text = _lstMusicas[index].singer ?? '';
     cdMusicEC.text = _lstMusicas[index].cdMusic.toString() ; 
  }

  @action
  Future<void> deleteMusica() async {
    try {
      _status = MinhasMusicasStateStatus.loading;
      await Future.delayed(Duration.zero);
      await _minhasMusicasRepository.deleteMusica(int.tryParse(cdMusicEC.text) ?? 0);
      _status = MinhasMusicasStateStatus.updateScreen;
    } catch (e) {
      print(e.toString());
      _status = MinhasMusicasStateStatus.error;
      throw Exception('Erro ao apagar música');
    }
  }

  @action
  void limparCampos() {
    nomeMusicaEC.clear(); 
    letraMusicaEC.clear();
    compositorEC.clear();
  }
}