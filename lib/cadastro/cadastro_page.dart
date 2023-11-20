// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/cadastro/controllers/cadastro_controller.dart';
import '../core/ui/class_estilos_texto.dart';
import '../core/ui/custom_text_field.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final controller = Modular.get<CadastroController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: const Color(0xFF1C2120),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              color: const Color(0xFF1C2120),
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
              height: MediaQuery.of(context).size.height * 0.65,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    // Wrap the inner ListView in a Column
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Cadastre-se',
                        style: ClassEstilosTextos.pretoSize24w600Montserrat,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      InkWell(
                        child: Text(
                          'Retorne para o login!',
                          style: ClassEstilosTextos.pretoSize14w400Montserrat,
                        ),
                        onTap: () {
                          Modular.to.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        icone: const Icon(Icons.person),
                        titulo: 'Usuario',
                        isRequired: true,
                        controller: controller.nmUserEC,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                          icone: const Icon(Icons.email),
                          isRequired: true,
                          titulo: 'Email',
                          controller: controller.emailEC),
                      const SizedBox(height: 16),
                      CustomTextField(
                          isRequired: true,
                          icone: const Icon(Icons.password_outlined),
                          titulo: 'Senha',
                          controller: controller.senhaEC),
                      const SizedBox(
                        height: 16,
                      ),
                      controller.carregando == false
                          ? ElevatedButton.icon(
                              onPressed: () async {
                                if (controller.formKey.currentState!.validate()) {
                                  bool logado = await controller.registro();
                                  switch (logado) {
                                    case true:
                                      Modular.to.navigate('/login');
                                      break;
                                    case false:
                                      const snackBar = SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('Registro falhou'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      break;
                                    default:
                                  }
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
                                'Cadastrar',
                                style: ClassEstilosTextos
                                    .branccoSize24w600Montserrat,
                              ),
                            )
                          : const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
