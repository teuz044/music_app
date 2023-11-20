
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/dio/dio_client.dart';
import '../../criar_nova_musica/models/music_model.dart';

class AdicionarMusicasRepository {
  final DioClient dio = DioClient();



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