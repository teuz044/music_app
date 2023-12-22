

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/dio/dio_client.dart';
import '../models/music_model.dart';

class CriarNovaMusicaRepository {
final DioClient dio = DioClient();

  Future<void> adicionarMusica(String nomeMusica, int cdUser,
      String letraMusica, int cdGrupoMusica) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      print(token);
      final response = dio.post(
        'v1/music/musics',
        data: {
          'cdUser': cdUser,
          'nmMusic': nomeMusica,
          'singer': letraMusica,
          'cdGender': cdGrupoMusica
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

  Future<List<MusicModel>> getMusicasPorId() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await dio.get(
        'v1/music/musics/get',
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
