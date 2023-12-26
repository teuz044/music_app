
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/dio/dio_client.dart';
import '../models/minhas_musicas_model.dart';

class MinhasMusicasRepository {
  
  final DioClient dio = DioClient();

  Future<void> criarVincularMusicaAoMeuBloco(MinhasMusicasModel minhasMusicasModel) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = dio.post(
        'v1/music/musics',
        data: {
          ''
        },
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      print(e.toString());
      throw Exception('Erro ao cadastrar repertório');
    }
  }

  Future<void> deleteMusica(int cdBlocoMusical) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      print(token);
      final response = dio.delete(
        'v1/music/block_music/$cdBlocoMusical',
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      print(e.toString());
      throw Exception('Erro ao apagar repertório');
    }
  }

  Future<List<MinhasMusicasModel>> getMusicasPorUserId(int userId) async {
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
          .map((e) => MinhasMusicasModel.fromMap(e))
          .toList();
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        return [];
      }
      return throw Exception('Erro ao buscar bloco musical');
    }
  }

}