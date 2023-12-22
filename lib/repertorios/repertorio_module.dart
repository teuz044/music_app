import 'package:music_app/repertorios/controllers/repertorios_controller.dart';
import 'package:music_app/repertorios/repertorio_page.dart';
import 'package:music_app/repertorios/repositories/repertorios_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../blocos_musicas/blocos_musicas_module.dart';

class RepertorioModule extends Module{
  @override
  void binds(i) {
    i.addLazySingleton(RepertoriosController.new);
    i.addLazySingleton(RepertoriosRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const RepertorioPage());
    r.module('/blocos_musicas', module: BlocosMusicasModule());
  }
}
