// ignore_for_file: use_key_in_widget_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/core/session/auth_store.dart';
import 'package:music_app/login/login_module.dart';

void main() {
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

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
    ); //added by extension 
  }
}



