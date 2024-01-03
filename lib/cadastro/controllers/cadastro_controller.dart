// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/cadastro/models/cadastro_model.dart';
import 'package:music_app/cadastro/repository/cadastro_repository.dart';
part 'cadastro_controller.g.dart';

class CadastroController = CadastroControllerBase with _$CadastroController;

abstract class CadastroControllerBase with Store {
  final CadastroRepository _cadastroRepository;

  CadastroControllerBase(this._cadastroRepository);

  final formKey = GlobalKey<FormState>();

  final emailEC = TextEditingController();
  final senhaEC = TextEditingController();
  final nmUserEC = TextEditingController();

  @readonly
  String _errorMessage = '';

  @readonly
  bool _carregando = false;

  @action
  Future<bool> registro() async {
    try {
      final Map<String, dynamic>? loginData =
          await _cadastroRepository.registro(CadastroModel(
              nmUser: nmUserEC.text,
              email: emailEC.text,
              password: senhaEC.text,
              role: 'ADMIN'));
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = loginData?['token'];
      final int? statusCode = loginData?['statusCode'];
      _carregando = true;
      await Future.delayed(Duration.zero);
      if (statusCode == 201) {
        // await prefs.setString('token', token);
        _carregando = false;
        return true;
      } else {
        _carregando = false;
        _errorMessage = 'Registro falhou';
        return false;
      }
    } catch (e) {
      _carregando = false;
      throw Exception('Registro falhou');
    }
  }
}
