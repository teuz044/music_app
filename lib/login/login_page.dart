// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/ui/class_estilos_texto.dart';
import 'controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Modular.get<LoginController>();

  @override
  void initState() {
    controller.limparCamposAoVoltar();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose(); // Chame o método de dispose do seu controller, se existir
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xFF1C2120),
          body: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Logo',
                      style: ClassEstilosTextos.branccoSize24w600Montserrat,
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                height: MediaQuery.of(context).size.height * 0.60,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Login',
                        style: ClassEstilosTextos.pretoSize24w600Montserrat,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      InkWell(
                        child: Text(
                          'Cadastre-se aqui!',
                          style: ClassEstilosTextos.pretoSize14w400Montserrat,
                        ),
                        onTap: () {
                          Modular.to.pushNamed('/cadastro');
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       TextField(
                        controller: controller.emailEC,
                        decoration: const InputDecoration(
                          labelText: 'Usuário/Email',
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                       TextField(
                        controller: controller.senhaEC,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          suffixIcon: Icon(Icons.password_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: const Text('Esqueceu a senha?'),
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      controller.carregando == false
                            ? ElevatedButton.icon(
                                onPressed: () async {
                                  bool logado = await controller.login(context);
                                  switch (logado) {
                                    case true:
                                      Modular.to.navigate(
                                          '/inicio');
                                      break;
                                    case false:
                                      const snackBar = SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('Login ou senha inválidos'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      break;
                                    default:
                                  }
                                },
                                icon: const Icon(Icons.login),
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromHeight(50),
                                    backgroundColor: const Color(0xFF1C2120),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20)))),
                                label: Text(
                                  'Login',
                                  style: ClassEstilosTextos
                                      .branccoSize24w600Montserrat,
                                ))
                            : const CircularProgressIndicator(),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
