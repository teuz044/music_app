
import 'package:music_app/core/dio/dio_client.dart';

import '../models/cadastro_model.dart';

class CadastroRepository {
  final DioClient _dio;

  CadastroRepository(this._dio);


  Future<Map<String, dynamic>?> registro(CadastroModel model) async {
    try {
      final response = await _dio.post(
        'v1/music/auth/register',
        data: {
          'nmUser': model.nmUser,
          'email': model.email,
          'password': model.password,
          'role' : 'ADMIN',
        },
      );

      if (response.statusCode == 201) {
        // Login bem-sucedido, extrair o token e o usuárioModel da resposta.
        final Map<String, dynamic> data = response.data;
        final String? token = data['token'];
        final int? usuarioID = data['cdUser'];
        final String? usuarioNome = data['nmUser'];

        if (token != null && usuarioID != null) {
          //  final authProvider = Provider.of<AuthProvider>(context, listen: false);
          // authProvider.setUsuarioModel(usuarioModel);
          return {
            'statusCode' : response.statusCode,
            'cdUser': usuarioID,
            'nmUser': usuarioNome,
            'token': token,
          };
        }
      } else if (response.statusCode == 400) {
        return null; // Retorne null em caso de erro
      }
    } catch (e) {
      return null; // Retorne null em caso de exceção
    }
  }
}
