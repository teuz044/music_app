
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioClient extends DioForNative{
  DioClient()
      : super(
          BaseOptions(
            baseUrl: 'http://192.168.1.23:80/', //TODO: alterar quando for para rota de produção
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 60),
          ),
        );
  
}


