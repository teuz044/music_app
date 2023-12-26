// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/minha_agenda/minha_agenda_module.dart';
import 'package:music_app/minhas_musicas/minhas_musicas_module.dart';
import 'package:music_app/repertorios/repertorio_module.dart';

import '../core/session/auth_store.dart';
import 'bem_vindo_page.dart';

class BemVindoModule extends Module{
  @override
  void binds(i) {
     i.addLazySingleton(AuthStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const BemVindoPage());
    r.module('/repertorios', module: RepertorioModule());
    r.module('/minha_agenda', module: MinhaAgendaModule());
    r.module('/minhas_musicas', module: MinhasMusicasModule());
  }
}