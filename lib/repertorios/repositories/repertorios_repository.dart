// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:music_app/repertorios/models/repertorio_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/dio/dio_client.dart';

class RepertoriosRepository {
  final DioClient dio = DioClient();

  Future<void> setRepertorio(String nomeRepertorio, int cdUser) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = dio.post(
        '/v1/music/repertoire',
        data: {
          'nmRepertoire': nomeRepertorio,
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

  Future<void> deleteRepertorio(int cdRepertorie) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = dio.delete(
        'v1/music/repertoire/$cdRepertorie',
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

  Future<List<RepertorioModel>> getRepertorioPorUserId(int userId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await dio.post(
        'v1/music/repertoire/$userId',
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
          },
        ),
      );

      return (response.data as List)
          .map((e) => RepertorioModel.fromMap(e))
          .toList();
   
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        return [];
      }
      return throw Exception('Erro ao buscar grupo');
    }
  }
}
