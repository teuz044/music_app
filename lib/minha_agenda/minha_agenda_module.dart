// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/minha_agenda/minha_agenda_page.dart';

class MinhaAgendaModule extends Module {
  @override
  void binds(i) {
    // i.addLazySingleton(CriarNovaMusicaController.new);
    // i.addLazySingleton(CriarNovaMusicaRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const MinhaAgendaPage());
  }
}
