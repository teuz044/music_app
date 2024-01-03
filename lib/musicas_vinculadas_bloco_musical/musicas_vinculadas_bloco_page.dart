// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/blocos_musicas/controllers/blocos_musicas_controller.dart';
import 'package:music_app/core/loader/loader.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/ui/class_estilos_texto.dart';
import 'controllers/musicas_vinculadas_bloco_controller.dart';

class MusicasVinculadasBlocoPage extends StatefulWidget {
  const MusicasVinculadasBlocoPage({super.key});

  @override
  State<MusicasVinculadasBlocoPage> createState() =>
      _MusicasVinculadasBlocoPageState();
}

class _MusicasVinculadasBlocoPageState extends State<MusicasVinculadasBlocoPage>
    with Loader {
  final controller = Modular.get<MusicasVinculadasBlocoController>();
  final blocosMusicasController = Modular.get<BlocosMusicasController>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case MinhasMusicasStateStatus.initial:
            Future.delayed(Duration.zero);
            break;
          case MinhasMusicasStateStatus.loading:
            showLoader();
            break;
          case MinhasMusicasStateStatus.loaded:
            hideLoader();
            Future.delayed(Duration.zero);
            break;
          case MinhasMusicasStateStatus.error:
            hideLoader();
            Future.delayed(Duration.zero);
            break;
          case MinhasMusicasStateStatus.updateScreen:
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Observer(builder: (context) {
        return Column(
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
                    'Minhas Musicas',
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
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 16),
                    child: SizedBox(
                      height: 39, // Altura desejada para a barra de pesquisa
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Pesquisar...',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical:
                                  0), // Reduzir o padding interno vertical
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent.shade100),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0), // Ajustar o padding do ícone
                            child: Icon(
                              Icons.search,
                              color: Colors.deepPurpleAccent.shade100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent.shade100),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Lista de Músicas'),
                              content: SizedBox(
                                width: double.maxFinite,
                                height: 300, // Ajuste a altura conforme necessário
                                child: ListView.builder(
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        trailing: IconButton(onPressed: () {
                                          
                                        }, icon: Icon(Icons.new_label_outlined, color: Colors.green,)),
                                        title: Text('TESTE 1'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.library_music_outlined),
                      label: Text(
                        'Vincular Música',
                        style: ClassEstilosTextos.brancoSize18w600OpenSans,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: SizedBox(
                height: 450,
                child: controller.lstMusicasDoBlocoMusical.isEmpty
                    ? Container(
                        child: const Center(
                            child: Text('Nenhuma música cadastrada')))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.lstMusicasDoBlocoMusical.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: const RoundedRectangleBorder(),
                            elevation: 2,
                            child: ListTile(
                              title: Text(
                                '123',
                                style:
                                    ClassEstilosTextos.pretoSize18w600OpenSans,
                              ),
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        );
      }),
    );
  }
}
