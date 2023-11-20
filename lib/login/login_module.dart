// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/bem_vindo/bem_vindo_module.dart';
import 'package:music_app/cadastro/cadastro_module.dart';
import 'package:music_app/login/login_page.dart';
import 'controllers/login_controller.dart';
import 'repository/login_repository.dart';
import 'splash_page.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(LoginRepository.new);
    i.addLazySingleton(LoginController.new);
    // i.addLazySingleton(DioClient.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.child('/login', child: (context) => const LoginPage());
    r.module('/cadastro', module: CadastroModule());
    r.module('/inicio', module: BemVindoModule());
  }
}
