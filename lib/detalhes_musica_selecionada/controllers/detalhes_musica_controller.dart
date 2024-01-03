import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/detalhes_musica_selecionada/repositories/detalhes_musica_selecionada_repository.dart';
import '../../core/session/session.dart' as session;
part 'detalhes_musica_controller.g.dart';

class DetalhesMusicaController = DetalhesMusicaControllerBase with _$DetalhesMusicaController;

enum DetalhesMusicaStateStatus {
  initial,
  loading,
  loaded,
  error,
  updateScreen,
}


abstract class DetalhesMusicaControllerBase with Store {
  final DetalhesMusicaSelecionadaRepository _detalhesMusicaSelecionadaRepository;
  DetalhesMusicaControllerBase(this._detalhesMusicaSelecionadaRepository);

  final nomeMusicaEC = TextEditingController();
  final compositorEC = TextEditingController();
  final letraMusicaEC = TextEditingController();

  @readonly
  var _status = DetalhesMusicaStateStatus.initial;


  @action
  Future<void> editarMusica(int idMusic) async {
    try {
      _status = DetalhesMusicaStateStatus.loading;
      await Future.delayed(Duration.zero);
      await _detalhesMusicaSelecionadaRepository.editarMusica(nomeMusicaEC.text, session.Session.userId, letraMusicaEC.text, compositorEC.text, idMusic);
      _status = DetalhesMusicaStateStatus.updateScreen;
    } catch (e) {
      _status = DetalhesMusicaStateStatus.error;
      throw Exception('Erro ao cadastrar música');
    }
  }

}