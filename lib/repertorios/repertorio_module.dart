import 'package:music_app/adicionar_musicas/adicionar_musica_module.dart';
import 'package:music_app/repertorios/controllers/repertorios_controller.dart';
import 'package:music_app/repertorios/repertorio_page.dart';
import 'package:music_app/repertorios/repositories/repertorios_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RepertorioModule extends Module{
  @override
  void binds(i) {
    i.addLazySingleton(RepertoriosController.new);
    i.addLazySingleton(RepertoriosRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const RepertorioPage());
    r.module('/adicionar_musica', module: AdicionarMusicaModule());
  }
}
