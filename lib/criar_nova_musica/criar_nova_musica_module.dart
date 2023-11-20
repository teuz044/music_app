import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/criar_nova_musica/controllers/criar_nova_musica_controller.dart';
import 'package:music_app/criar_nova_musica/criar_nova_musica_page.dart';
import 'package:music_app/criar_nova_musica/repositories/criar_nova_musica_repository.dart';

class CriarNovaMusicaModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(CriarNovaMusicaController.new);
    i.addLazySingleton(CriarNovaMusicaRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const CriarNovaMusicaPage());
  }
}
