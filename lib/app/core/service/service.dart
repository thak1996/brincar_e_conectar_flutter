import 'dart:developer';
import 'package:dio/dio.dart';
import '../utils/exceptions.dart';

class BaseService {
  BaseService() : dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000/api')) {
    _setupInterceptors();
  }

  final Dio dio;

  void _setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('Requisição para: ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Verifica se a resposta contém sucesso
          if (response.data is Map<String, dynamic> &&
              response.data['success'] == false) {
            final message = response.data['message'] ?? 'Erro desconhecido';
            throw ValidationException(message, response.statusCode);
          }
          return handler.next(response);
        },
        onError: (dioError, handler) {
          // Trata erros de conexão e HTTP
          if (dioError.response != null) {
            final statusCode = dioError.response?.statusCode;
            final message =
                dioError.response?.data['message'] ?? 'Erro desconhecido';

            if (statusCode == 401) {
              throw UnauthorizedException(message, statusCode);
            } else if (statusCode == 404) {
              throw NotFoundException(message, statusCode);
            } else if (statusCode == 422) {
              throw ValidationException(message, statusCode);
            } else if (statusCode == 500) {
              throw ServerException(message, statusCode);
            } else {
              throw GeneralException(message, statusCode);
            }
          } else {
            throw NetworkException('Erro de conexão com o servidor.');
          }
        },
      ),
    );
  }

  Future<Response> delete(String endpoint) async {
    return await dio.delete(endpoint);
  }

  Future<Response> get(String endpoint) async {
    return await dio.get(endpoint);
  }

  Future<Response> patch(String endpoint, Map<String, dynamic> data) async {
    return await dio.patch(endpoint, data: data);
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    return await dio.post(endpoint, data: data);
  }

  Future<Response> put(String endpoint, Map<String, dynamic> data) async {
    return await dio.put(endpoint, data: data);
  }
}
