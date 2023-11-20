// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/adicionar_musicas/adicionar_musica_page.dart';
import 'package:music_app/adicionar_musicas/controllers/adicionar_musicas_controller.dart';
import 'package:music_app/adicionar_musicas/repositories/adicionar_musicas_repository.dart';
import 'package:music_app/criar_nova_musica/criar_nova_musica_module.dart';

class AdicionarMusicaModule extends Module {

  @override
  void binds(i) {
    i.addLazySingleton(AdicionarMusicasController.new);
    i.addLazySingleton(AdicionarMusicasRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const AdicionarMusicaPage());
    r.module('/criar_musica', module: CriarNovaMusicaModule());
  }
}
