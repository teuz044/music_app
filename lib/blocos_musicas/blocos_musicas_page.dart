import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/blocos_musicas/controllers/blocos_musicas_controller.dart';
import 'package:music_app/core/ui/custom_text_field.dart';
import 'package:music_app/repertorios/controllers/repertorios_controller.dart';
import '../core/ui/class_estilos_texto.dart';
import '../core/loader/loader.dart';

class BlocosMusicasPage extends StatefulWidget {
  final RepertoriosController repertoriosController;
  const BlocosMusicasPage({super.key, required this.repertoriosController});

  @override
  State<BlocosMusicasPage> createState() => _BlocosMusicasPageState();
}

class _BlocosMusicasPageState extends State<BlocosMusicasPage> with Loader {
  final controller = Modular.get<BlocosMusicasController>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case BlocosMusicasStateStatus.initial:
            Future.delayed(Duration.zero);
            break;
          case BlocosMusicasStateStatus.loading:
            showLoader();
            break;
          case BlocosMusicasStateStatus.loaded:
            hideLoader();
            Future.delayed(Duration.zero);
            break;
          case BlocosMusicasStateStatus.error:
            hideLoader();
            Future.delayed(Duration.zero);
            break;
          case BlocosMusicasStateStatus.updateScreen:
            hideLoader();
            setState(() {});
            break;
        }
      });
      await controller.getBlocoMusicalPorUserId(
          widget.repertoriosController.idGrupoMusicalEC.text);
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
                    'Blocos Musicais',
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
                              title: const Text('Criar Bloco Musical'),
                              content: CustomTextField(controller: TextEditingController(), titulo: 'Nome do Bloco Musical'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancelar'),
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Salvar'),
                                  child: const Text('Salvar'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: Text(
                        'Novo bloco',
                        style: ClassEstilosTextos.brancoSize18w600OpenSans,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: SizedBox(
                height: 450,
                child: controller.lstBlocosMusicaisFilterPorRepertorioId.isEmpty
                    ? Container(
                        child: const Center(
                            child: Text('Nenhum bloco cadastrado')))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller
                            .lstBlocosMusicaisFilterPorRepertorioId.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: const RoundedRectangleBorder(),
                            elevation: 2,
                            child: ListTile(
                              title: Text(
                                controller
                                        .lstBlocosMusicaisFilterPorRepertorioId[
                                            index]
                                        .nmBlockMusic ??
                                    '',
                                style:
                                    ClassEstilosTextos.pretoSize18w600OpenSans,
                              ),
                              subtitle: Text(
                                  'Quantidade de Músicas: ${controller.lstBlocosMusicaisFilterPorRepertorioId[index].cdMusics.length.toString()}'),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
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
