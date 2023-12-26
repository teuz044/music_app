import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/detalhes_musica_selecionada/detalhes_musica_page.dart';

class DetalhesMusicaModule extends Module{
   @override
  void binds(i) {
    // i.addLazySingleton(MinhasMusicasController.new);
    //  i.addLazySingleton(MinhasMusicasRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const DetalhesMusicaPage());
  }
}