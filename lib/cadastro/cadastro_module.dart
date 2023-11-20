// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/cadastro/cadastro_page.dart';
import 'package:music_app/cadastro/controllers/cadastro_controller.dart';
import 'package:music_app/cadastro/repository/cadastro_repository.dart';

import '../core/dio/dio_client.dart';

class CadastroModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
    i.addLazySingleton(CadastroController.new);
    i.addLazySingleton(CadastroRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const CadastroPage());
  }
}
