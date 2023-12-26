import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/core/loader/loader.dart';
import 'package:music_app/minhas_musicas/controllers/minhas_musicas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/ui/class_estilos_texto.dart';
import '../core/ui/custom_text_field.dart';

class MinhasMusicasPage extends StatefulWidget {
  const MinhasMusicasPage({super.key});

  @override
  State<MinhasMusicasPage> createState() => _MinhasMusicasPageState();
}

class _MinhasMusicasPageState extends State<MinhasMusicasPage> with Loader {
  final controller = Modular.get<MinhasMusicasController>();
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
      await controller.getMusicasPorIdUser();
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Observer(builder: (context) {
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
                      'Minhas Músicais',
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
                                title: const Text('Criar Música'),
                                content: Container(
                                  height: 400,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                            controller: controller.nomeMusicaEC,
                                            titulo: 'Nome da música'),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        CustomTextField(
                                            controller: controller.compositorEC,
                                            titulo: 'Compositor(a)'),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        CustomTextField(
                                          controller: controller.letraMusicaEC,
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
                                      await controller.adicionarMusica();
                                      await controller.getMusicasPorIdUser();
                                      controller.limparCampos();
                                      await controller
                                          .getMusicasPorIdUser()
                                          .then((value) =>
                                              Modular.to.pop(context));
                                    },
                                    child: const Text('Salvar'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: Text(
                          'Nova Música',
                          style: ClassEstilosTextos.brancoSize18w600OpenSans,
                        )),
                  )
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: SizedBox(
                  height: 450,
                  child: controller.lstMusicas.isEmpty
                      ? Container(
                          child: const Center(
                              child: Text('Nenhuma música cadastrada')))
                      : ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemCount: controller.lstMusicas.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {},
                              title: Text(
                                controller.lstMusicas[index].nmMusic ?? '',
                                style:
                                    ClassEstilosTextos.pretoSize18w600OpenSans,
                              ),
                              subtitle: Text(
                                  'Compositor(a): ${controller.lstMusicas[index].singer ?? ''}'),
                              trailing: IconButton(
                                onPressed: () async {
                                  controller.selecionarMusica(index);
                                  await controller.deleteMusica();
                                  await controller.getMusicasPorIdUser();
                                  await controller.getMusicasPorIdUser();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
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
      ),
    );
  }
}
