import 'package:dio/dio.dart';
import 'package:music_app/repertorios/models/grupos_musica_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/dio/dio_client.dart';

class RepertoriosRepository {
  final DioClient dio = DioClient();

  Future<void> setGruposMusicais(String nomeGrupo, int cdUser) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      print(token);
      final response = dio.post(
        'v1/music/genders/post',
        data: {
          'nmGender': nomeGrupo,
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
      throw Exception('Erro ao cadastrar grupo');
    }
  }

  Future<void> deleteGruposMusicais(int idGrupo) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      print(token);
      final response = dio.delete(
        'v1/music/genders/delete/$idGrupo',
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

  Future<List<GruposMusicaModel>> getGruposMusicaisPorId() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await dio.get(
        'v1/music/genders/get',
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
          },
        ),
      );

      return (response.data as List)
          .map((e) => GruposMusicaModel.fromMap(e))
          .toList();
   
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        return [];
      }
      return throw Exception('Erro ao buscar grupo');
    }
  }
}
