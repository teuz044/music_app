// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable, depend_on_referenced_packages
import 'package:flutter/material.dart';

import '../../core/dio/dio_client.dart';

class LoginRepository {
  final DioClient dio = DioClient();


  Future<Map<String, dynamic>?> login(
      String email, String senha, BuildContext context) async {
    try {
      final response = await dio.post(
        'v1/music/auth/login',
        data: {
          'email': email,
          'password': senha,
        },
        
      );

      if (response.statusCode == 200) {
        // Login bem-sucedido, extrair o token e o usuárioModel da resposta.
        final Map<String, dynamic> data = response.data;
        final String? token = data['token'];
        final int? usuarioID = data['cdUser'];
        final String? usuarioNome = data['nmUser'];

        if (token != null && usuarioID != null) {
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
