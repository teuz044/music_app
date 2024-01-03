import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/core/ui/custom_text_field.dart';
import 'package:music_app/repertorios/controllers/repertorios_controller.dart';
import '../core/loader/loader.dart';
import '../core/ui/class_estilos_texto.dart';

class RepertorioPage extends StatefulWidget  {
  const RepertorioPage({super.key});

  @override
  State<RepertorioPage> createState() => _RepertorioPageState();
}

class _RepertorioPageState extends State<RepertorioPage> with Loader {
  final controller = Modular.get<RepertoriosController>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case RepertorioStateStatus.initial:
            Future.delayed(Duration.zero);
            break;
          case RepertorioStateStatus.loading:
          showLoader();
            break;
          case RepertorioStateStatus.loaded:
          hideLoader();
            Future.delayed(Duration.zero);
            break;
          case RepertorioStateStatus.error:
            Future.delayed(Duration.zero);
            break;
          case RepertorioStateStatus.updateScreen:
          hideLoader();
            setState(() {
            });
            break;
        }
      });
      await controller.getRepertorioPorUserId();
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
      body: Observer(builder: (_) {
        return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 32.0, right: 16, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Modular.to.navigate('/inicio');
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 35,
                            )),
                        Text(
                          'Meu repertório',
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
                      Column(
                        children: [
                          Text(
                            'Repertórios Musicais',
                            style: ClassEstilosTextos.pretoSize18w600Montserrat,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Container(
                              height: 3,
                              width: 220,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Tooltip(
                          message: 'Adicionar Repertório',
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 150,
                                      child: Center(
                                        child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Adicione um repertório',
                                                  style: ClassEstilosTextos
                                                      .pretoSize18w600Montserrat,
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: CustomTextField(
                                                          borderRadius: 0,
                                                          controller: controller
                                                              .nomeRepertorioEC,
                                                          titulo:
                                                              'Nome do repertório'),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Flexible(
                                                      child:
                                                          ElevatedButton.icon(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.green
                                                                  .shade400,
                                                          fixedSize: const Size
                                                              .fromHeight(60),
                                                        ),
                                                        onPressed: () async {
                                                          await controller.setRepertorio();
                                                          controller.limparCampos();
                                                          await controller.getRepertorioPorUserId().then(
                                                            (value) {
                                                              Navigator.pop(context);
                                                            },
                                                          );
                                                          await controller.getRepertorioPorUserId();
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .add_circle_outline_rounded,
                                                          size: 30,
                                                        ),
                                                        label: Text(
                                                          'Salvar',
                                                          style: ClassEstilosTextos
                                                              .branccoSize18w600Montserrat,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.add)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 420,
                    child: controller.lstRepertorios.isEmpty
                        ? Container(
                            child: const Center(
                                child: Text('Nenhum repertório encontrado')),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                              thickness: 1,
                            ),
                            shrinkWrap: true,
                            itemCount: controller.lstRepertorios.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: ListTile(
                                        trailing: IconButton(
                                                onPressed: () async {
                                                  await controller.selecionarRepertorio(index);
                                                  await controller.deleteRepertorio();
                                                  controller.limparCampos();
                                                  await controller.getRepertorioPorUserId();
                                                  await controller.getRepertorioPorUserId();
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                ),
                                              ),
                                        title: Text(
                                          controller.lstRepertorios[index]
                                                  .nmRepertoire ??
                                              '',
                                          style: ClassEstilosTextos
                                              .pretoSize18w500OpenSans,
                                        ),
                                        onTap: () {
                                          controller.selecionarRepertorio(index);
                                          Modular.to.pushNamed('blocos_musicas');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                 
                ],
              );
      }),
    );
  }
}
