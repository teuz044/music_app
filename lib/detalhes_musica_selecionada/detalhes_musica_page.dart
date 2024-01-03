import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/core/loader/loader.dart';
import 'package:music_app/detalhes_musica_selecionada/controllers/detalhes_musica_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/minhas_musicas/controllers/minhas_musicas_controller.dart';

import '../core/ui/class_estilos_texto.dart';
import '../core/ui/custom_text_field.dart';

class DetalhesMusicaPage extends StatefulWidget {
  const DetalhesMusicaPage({super.key});

  @override
  State<DetalhesMusicaPage> createState() => _DetalhesMusicaPageState();
}

class _DetalhesMusicaPageState extends State<DetalhesMusicaPage> with Loader {
  final controller = Modular.get<DetalhesMusicaController>();
  final minhasMusicasController = Modular.get<MinhasMusicasController>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case DetalhesMusicaStateStatus.initial:
            Future.delayed(Duration.zero);
            break;
          case DetalhesMusicaStateStatus.loading:
            showLoader();
            break;
          case DetalhesMusicaStateStatus.loaded:
            hideLoader();
            Future.delayed(Duration.zero);
            break;
          case DetalhesMusicaStateStatus.error:
            hideLoader();
            Future.delayed(Duration.zero);
            break;
          case DetalhesMusicaStateStatus.updateScreen:
            hideLoader();
            setState(() {});
            break;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    statusReactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Observer(builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0, right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Modular.to.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 35,
                      )),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Criar Música'),
                            content: SizedBox(
                              height: 400,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CustomTextField(
                                        controller: minhasMusicasController
                                            .nomeMusicaEC,
                                        titulo: 'Nome da música'),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    CustomTextField(
                                        controller: minhasMusicasController
                                            .compositorEC,
                                        titulo: 'Compositor(a)'),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    CustomTextField(
                                      controller:
                                          minhasMusicasController.letraMusicaEC,
                                      titulo: 'Letra',
                                      maxLines: 11,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancelar'),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await controller.editarMusica(int.tryParse(minhasMusicasController.cdMusicEC.text) ?? 0);
                                  // await minhasMusicasController.getMusicasPorIdUser();
                                  // minhasMusicasController.limparCampos();
                                  // await minhasMusicasController
                                  //     .getMusicasPorIdUser()
                                  //     .then(
                                  //       (value) => Modular.to.pop(context),
                                  //     );
                                },
                                child: const Text('Salvar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Editar'),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.music_note,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      minhasMusicasController.nomeMusicaEC.text,
                      style: ClassEstilosTextos.pretoSize18w500OpenSans,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 46.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(minhasMusicasController.compositorEC.text),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, top: 8, bottom: 8, right: 24),
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.7),
                child: Scrollbar(
                  thickness: 3,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Text(
                      minhasMusicasController.letraMusicaEC.text,
                      style: ClassEstilosTextos.pretoSize18w500OpenSans,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
