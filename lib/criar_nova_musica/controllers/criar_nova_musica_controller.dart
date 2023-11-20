
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/criar_nova_musica/repositories/criar_nova_musica_repository.dart';
import '../../../core/session/session.dart' as session;
part 'criar_nova_musica_controller.g.dart';

class CriarNovaMusicaController = CriarNovaMusicaControllerBase
    with _$CriarNovaMusicaController;

  enum CriarMusicaStateStatus {
  initial,
  loading,
  loaded,
  error,
  updateScreen,
}

abstract class CriarNovaMusicaControllerBase with Store {
  final CriarNovaMusicaRepository criarNovaMusicaRepository;

  final List<String> generosMusicais = [
    'Selecione um gênero',
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

  @readonly
  String _selectedGenre = 'Selecione um gênero';

  @readonly
  var _status = CriarMusicaStateStatus.initial;

  final nomeMusicaEC = TextEditingController();
  final letraMusicaEC = TextEditingController();

  CriarNovaMusicaControllerBase(this.criarNovaMusicaRepository);

  @action
  Future<void> adicionarMusica(int cdGrupo) async {
    try {
      _status = CriarMusicaStateStatus.loaded;
      await Future.delayed(Duration.zero);
      await criarNovaMusicaRepository.adicionarMusica(nomeMusicaEC.text, session.Session.userId, letraMusicaEC.text, cdGrupo);
      _status = CriarMusicaStateStatus.updateScreen;
    } catch (e) {
      print(e.toString());
      _status = CriarMusicaStateStatus.error;
      throw Exception('Erro ao cadastrar grupo');
    }
  }
}
