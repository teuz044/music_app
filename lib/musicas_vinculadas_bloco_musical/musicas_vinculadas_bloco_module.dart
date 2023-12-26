import 'package:flutter_modular/flutter_modular.dart';

import '../blocos_musicas/controllers/blocos_musicas_controller.dart';
import 'controllers/musicas_vinculadas_bloco_controller.dart';
import 'musicas_vinculadas_bloco_page.dart';
import 'repositories/minhas_musicas_repository.dart';

class MusicasVinculadasBlocoModule extends Module{
  @override
  void binds(i) {
    i.addLazySingleton(MusicasVinculadasBlocoController.new);
    i.addLazySingleton(MinhasMusicasRepository.new);
    i.addLazySingleton(BlocosMusicasController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const MusicasVinculadasBlocoPage());
  }
}