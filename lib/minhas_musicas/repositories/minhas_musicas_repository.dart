
// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/dio/dio_client.dart';
import '../models/music_model.dart';

class MinhasMusicasRepository {
  final DioClient dio = DioClient();

  Future<void> deleteMusica(int idMusic) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      print(token);
      final response = dio.delete(
        'v1/music/musics/delete/$idMusic',
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      print(e.toString());
      throw Exception('Erro ao apagar grupo');
    }
  }

    Future<void> adicionarMusica(String nomeMusica, int cdUser,
      String letraMusica, String compositor ) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      print(token);
      final response = dio.post(
        'v1/music/musics',
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
      print(e.toString());
      throw Exception('Erro ao cadastrar música');
    }
  }

  Future<List<MusicModel>> getMusicasPorIdUser(int userId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await dio.post(
        'v1/music/musics/$userId',
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
          },
        ),
      );

      return (response.data as List)
          .map((e) => MusicModel.fromMap(e))
          .toList();
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        return [];
      }
      return throw Exception('Erro ao buscar Musicas');
    }
  }
}