// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:music_app/adicionar_musicas/controllers/adicionar_musicas_controller.dart';
import 'package:music_app/repertorios/controllers/repertorios_controller.dart';
import '../core/ui/class_estilos_texto.dart';

class AdicionarMusicaPage extends StatefulWidget {
  const AdicionarMusicaPage({super.key});

  @override
  State<AdicionarMusicaPage> createState() => _AdicionarMusicaPageState();
}

class _AdicionarMusicaPageState extends State<AdicionarMusicaPage> {
  final controller = Modular.get<AdicionarMusicasController>();
  final repertorioController = Modular.get<RepertoriosController>();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case AdicionarMusicasStateStatus.initial:
           Future.delayed(Duration.zero);
            break;
          case AdicionarMusicasStateStatus.loading:
             EasyLoading.show(); 
            break;
          case AdicionarMusicasStateStatus.loaded:
           Future.delayed(Duration.zero);
           EasyLoading.dismiss();
            break;
          case AdicionarMusicasStateStatus.error:
            Future.delayed(Duration.zero);
           
            break;
          case AdicionarMusicasStateStatus.updateScreen:
            EasyLoading.dismiss();
            setState(() {});
            break;
        }
      });
      await controller.getMusicasPorId(int.tryParse(repertorioController.idGrupoMusicalEC.text) ?? 0);
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
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0, right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 35,
                      )),
                  Text(
                    'Grupo: ${repertorioController.nomeGrupoMusicalEC.text}',
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
            
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32),
              child: TextFormField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelText: 'Digite o nome da música',
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                    children: [
                      Text(
                        'Minhas Músicas',
                        style: ClassEstilosTextos.pretoSize18w600Montserrat,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          height: 3,
                          width: 174,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
            ),
            const SizedBox(
              height: 4,
            ),
            Flexible(
              flex: 4,
              child: controller.lstMusicas.isEmpty ? Container(
                child: const Center(child: Text('Nenhuma música encontrada'),),
              ) : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.lstMusicas.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Card(
                      child: ListTile(
                        subtitle: Text(controller.lstMusicas[index].nmGender.toString()),
                        title: Text(controller.lstMusicas[index].nmMusic.toString(),
                          style: ClassEstilosTextos.pretoSize18w600Montserrat,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                      fixedSize: const Size(255, 50),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Meu Repertório',
                      style: ClassEstilosTextos.branccoSize18w600Montserrat,
                    )),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(50)),
              onPressed: () {
                Modular.to.pushNamed('criar_musica');
              },
              icon: const Icon(Icons.add),
              label: Text(
                'Adicione sua música',
                style: ClassEstilosTextos.branccoSize18w600Montserrat,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );
    });
  }
}
