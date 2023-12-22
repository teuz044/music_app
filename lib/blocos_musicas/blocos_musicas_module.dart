
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/blocos_musicas/blocos_musicas_page.dart';
import 'package:music_app/blocos_musicas/controllers/blocos_musicas_controller.dart';
import 'package:music_app/blocos_musicas/repositories/blocos_musicais_repository.dart';

import '../repertorios/controllers/repertorios_controller.dart';
class BlocosMusicasModule extends Module {
  
   @override
  void binds(i) {
    i.addLazySingleton(BlocosMusicasController.new);
    i.addLazySingleton(BlocosMusicaisRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => BlocosMusicasPage(repertoriosController: Modular.get<RepertoriosController>(),));
  }
}