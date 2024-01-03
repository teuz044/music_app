
// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/dio/dio_client.dart';

class DetalhesMusicaSelecionadaRepository {
  
 final DioClient dio = DioClient();

 Future<void> editarMusica(String nomeMusica, int cdUser,
      String letraMusica, String compositor, int idMusic) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = dio.put(
        'v1/music/musics/put/$idMusic',
        data: {
          'nmMusic': nomeMusica,
          'singer': compositor,
          'letterMusic': letraMusica,

          'cdUser': cdUser
        },
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      throw Exception('Erro ao atualizar música');
    }
  }

}