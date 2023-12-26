import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/minhas_musicas_model.dart';
part 'musicas_vinculadas_bloco_controller.g.dart';

class MusicasVinculadasBlocoController = MusicasVinculadasBlocoControllerBase with _$MusicasVinculadasBlocoController;

enum MinhasMusicasStateStatus {
  initial,
  loading,
  loaded,
  error,
  updateScreen,
}

abstract class MusicasVinculadasBlocoControllerBase with Store {
   
   
  @readonly
  var _status = MinhasMusicasStateStatus.initial;

  @readonly
  var _lstMusicasDoBlocoMusical = <MinhasMusicasModel>[];

}