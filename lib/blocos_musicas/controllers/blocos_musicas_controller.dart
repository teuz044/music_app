import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/blocos_musicas/models/bloco_musicas_model.dart';
import 'package:music_app/blocos_musicas/repositories/blocos_musicais_repository.dart';
import '../../core/session/session.dart' as session;
part 'blocos_musicas_controller.g.dart';

class BlocosMusicasController = BlocosMusicasControllerBase
    with _$BlocosMusicasController;

enum BlocosMusicasStateStatus {
  initial,
  loading,
  loaded,
  error,
  updateScreen,
}

abstract class BlocosMusicasControllerBase with Store {
  final BlocosMusicaisRepository _blocosMusicaisRepository;
  BlocosMusicasControllerBase(this._blocosMusicaisRepository);

  @readonly
  var _status = BlocosMusicasStateStatus.initial;

  @readonly
  var _lstBlocosMusicais = <BlocoMusicasModel>[];

  @readonly
  var _lstBlocosMusicaisFilterPorRepertorioId = <BlocoMusicasModel>[];

  String errorMessage = '';

  final nmBlockMusicEC = TextEditingController();
  final cdBlockMusicEC = TextEditingController();

  @action
  Future<void> getBlocoMusicalPorUserId(String cdRepertorie) async {
    try {
      _status = BlocosMusicasStateStatus.loading;
      _lstBlocosMusicais = await _blocosMusicaisRepository.getBlocoMusicalPorUserId(session.Session.userId);
      _lstBlocosMusicaisFilterPorRepertorioId = _lstBlocosMusicais.where((element) => element.cdRepertoire.toString() == cdRepertorie).toList();
      await Future.delayed(Duration.zero);
      _status = BlocosMusicasStateStatus.updateScreen;
    } catch (e) {
      if (_lstBlocosMusicais.isEmpty) {
        _lstBlocosMusicais = [];
      }
      _status = BlocosMusicasStateStatus.error;
      throw Exception('Erro ao buscar repertório');
    }
  }

  @action
  Future<void> setBlocoMusical(int repertorioId) async {
    try {
      _status = BlocosMusicasStateStatus.loading;
      await Future.delayed(Duration.zero);
      await _blocosMusicaisRepository.setBlocoMusical(nmBlockMusicEC.text, session.Session.userId, repertorioId);
      _status = BlocosMusicasStateStatus.updateScreen;
    } catch (e) {
      _status = BlocosMusicasStateStatus.error;
      throw Exception('Erro ao cadastrar bloco');
    }
  }

  @action
  Future<void> deleteBlocoMusical() async {
    try {
      _status = BlocosMusicasStateStatus.loading;
      await Future.delayed(Duration.zero);
      await _blocosMusicaisRepository.deleteBlocoMusical(int.tryParse(cdBlockMusicEC.text) ?? 0);
      _status = BlocosMusicasStateStatus.updateScreen;
    } catch (e) {
      _status = BlocosMusicasStateStatus.error;
      throw Exception('Erro ao apagar bloco');
    }
  }

  @action
  void selecionarBlocoMusical(int index) {
    nmBlockMusicEC.text = _lstBlocosMusicaisFilterPorRepertorioId[index].nmBlockMusic ?? '';
    cdBlockMusicEC.text = _lstBlocosMusicaisFilterPorRepertorioId[index].cdBlockMusic.toString();
  }
}
