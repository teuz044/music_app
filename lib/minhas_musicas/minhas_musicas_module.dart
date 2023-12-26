import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/minhas_musicas/controllers/minhas_musicas_controller.dart';
import 'package:music_app/minhas_musicas/minhas_musicas_page.dart';
import 'package:music_app/minhas_musicas/repositories/minhas_musicas_repository.dart';

class MinhasMusicasModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(MinhasMusicasController.new);
     i.addLazySingleton(MinhasMusicasRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const MinhasMusicasPage());
  }
}
