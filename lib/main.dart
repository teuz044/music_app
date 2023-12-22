// ignore_for_file: use_key_in_widget_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/core/session/auth_store.dart';
import 'package:music_app/login/login_module.dart';

void main() {
  configLoading();
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(AuthStore.new);
  }

  @override
  void routes(r) {
    r.module('/', module: LoginModule());
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom // Usando um estilo personalizado
    ..indicatorSize = 45.0 // Tamanho do indicador
    ..radius = 10.0 // Raio do indicador (opcional)
    ..progressColor = Colors.blue // Cor do indicador (opcional)
    ..backgroundColor = Colors.transparent // Cor de fundo (transparente para centralizar)
    ..indicatorWidget = Center( // Centralizando o indicador usando um widget Center
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
}
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}
