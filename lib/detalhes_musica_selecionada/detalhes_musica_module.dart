import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/detalhes_musica_selecionada/detalhes_musica_page.dart';
import 'package:music_app/detalhes_musica_selecionada/repositories/detalhes_musica_selecionada_repository.dart';

import '../minhas_musicas/controllers/minhas_musicas_controller.dart';
import '../minhas_musicas/repositories/minhas_musicas_repository.dart';
import 'controllers/detalhes_musica_controller.dart';

class DetalhesMusicaModule extends Module{
   @override
  void binds(i) {
    i.addLazySingleton(MinhasMusicasController.new);
    i.addLazySingleton(DetalhesMusicaController.new);
    i.addLazySingleton(DetalhesMusicaSelecionadaRepository.new);
     i.addLazySingleton(MinhasMusicasRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const DetalhesMusicaPage());
  }
}