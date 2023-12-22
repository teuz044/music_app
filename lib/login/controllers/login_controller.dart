import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repository/login_repository.dart';
import '../../core/session/session.dart' as session;
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginRepository _loginRepository;
  LoginControllerBase(this._loginRepository);

  final GetIt locator = GetIt.instance;

  final emailEC = TextEditingController();
  final senhaEC = TextEditingController();

  @readonly
  String _errorMessage = '';

  @readonly
  bool _carregando = false;

  @action
  void limparCamposAoVoltar() {
    _carregando = true;
    emailEC.clear();
    senhaEC.clear();
    _carregando = false;
  }

  @action
  Future<bool> login(BuildContext context) async {
    try {
      final Map<String, dynamic>? loginData =
          await _loginRepository.login(emailEC.text, senhaEC.text, context);
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? token = loginData?['token'];
      final int? usuarioID = loginData?['cdUser'];
      final String? usuarioNome = loginData?['nmUser'];
      final int? statusCode = loginData?['statusCode'];
      _carregando = true;
      await Future.delayed(Duration.zero);
      if (statusCode == 200) {
        await prefs.setString('token', token ?? '');
        await prefs.setInt('cdUser', usuarioID ?? 0);
        await prefs.setString('usuarioNome', usuarioNome ?? '');

        session.Session.userId = usuarioID ?? 0;
        session.Session.userName = usuarioNome ?? '';
        session.Session.token = token ?? '';

        _carregando = false;
        return true;
      } else {
        _carregando = false;
        _errorMessage = 'Login não autorizado';
        return false;
      }
    } catch (e) {
      _carregando = false;
      throw Exception('Erro ao buscar anuncios');
    }
  }

  @action
  void dispose() {}
}
