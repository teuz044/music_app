// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:music_app/core/dio/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/bloco_musicas_model.dart';

class BlocosMusicaisRepository {
  final DioClient dio = DioClient();

  Future<void> setBlocoMusical(String nmBlockMusic, int cdUser, int cdRepertoire) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = dio.post(
        'v1/music/block_music',
        data: {
          'nmBlockMusic': nmBlockMusic,
          'cdRepertoire': cdRepertoire,
          'cdUser': cdUser,
        },
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      throw Exception('Erro ao cadastrar repertório');
    }
  }

  Future<void> deleteBlocoMusical(int cdBlocoMusical) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = dio.delete(
        'v1/music/block_music/$cdBlocoMusical',
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      throw Exception('Erro ao apagar repertório');
    }
  }

  Future<List<BlocoMusicasModel>> getBlocoMusicalPorUserId(int userId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await dio.post(
        'v1/music/block_music/$userId',
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
          },
        ),
      );
      return (response.data as List)
          .map((e) => BlocoMusicasModel.fromMap(e))
          .toList();
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        return [];
      }
      return throw Exception('Erro ao buscar bloco musical');
    }
  }
}
