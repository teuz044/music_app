// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/core/ui/custom_text_field.dart';
import 'package:music_app/criar_nova_musica/controllers/criar_nova_musica_controller.dart';
import '../core/ui/class_estilos_texto.dart';
import '../repertorios/controllers/repertorios_controller.dart';
import '../../core/session/session.dart' as session;

class CriarNovaMusicaPage extends StatefulWidget {
  const CriarNovaMusicaPage({super.key});

  @override
  State<CriarNovaMusicaPage> createState() => _CriarNovaMusicaPageState();
}

class _CriarNovaMusicaPageState extends State<CriarNovaMusicaPage> {
  final controller = Modular.get<CriarNovaMusicaController>();
  final repertorioController = Modular.get<RepertoriosController>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) async{
        switch (status) {
          case CriarMusicaStateStatus.initial:
           Future.delayed(Duration.zero);
            break;
          case CriarMusicaStateStatus.loading:
             await Future.delayed(Duration(milliseconds: 100));
             EasyLoading.show(); 
            break;
          case CriarMusicaStateStatus.loaded:
           Future.delayed(Duration.zero);
           EasyLoading.dismiss();
            break;
          case CriarMusicaStateStatus.error:
            Future.delayed(Duration.zero);
            
            break;
          case CriarMusicaStateStatus.updateScreen:
            EasyLoading.dismiss();
            setState(() {});
            break;
        }
      });
      // await repertorioController.getGruposMusicais();
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
    return Observer(builder: (context) {
      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0, right: 16, left: 16),
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
                  Text(
                    'Adicione sua música',
                    style: ClassEstilosTextos.pretoSize20w600Montserrat,
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Text('Grupo: ${repertorioController.nomeRepertorioEC.text}', style: ClassEstilosTextos.pretoSize18w400Montserrat,),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 56.0, right: 56),
              child: CustomTextField(
                  controller: controller.nomeMusicaEC,
                  titulo: 'Nome da sua música',
                  icone: const Icon(Icons.music_note_outlined)),
            ),
            const SizedBox(
              height: 16,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: CustomTextField(
                  controller: controller.letraMusicaEC,
                  titulo: 'Letra da música',
                  maxLines: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await controller.adicionarMusica(int.tryParse(repertorioController.idGrupoMusicalEC.text) ?? 0);
                Modular.to.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              icon: const Icon(
                Icons.add_circle_outline_sharp,
                size: 30,
              ),
              label: Text(
                'Adicionar Música',
                style: ClassEstilosTextos.branccoSize18w600Montserrat,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    });
  }
}
