import 'package:dio/dio.dart';
import '../interfaces/service.interface.dart';

class BaseService implements IService {
  BaseService()
    : dio = Dio(
        BaseOptions(
          baseUrl:
              'https://raw.githubusercontent.com/thak1996/brincar_e_conectar-json/refs/heads/main',
        ),
      );

  final Dio dio;

  @override
  Future<Response> delete(String endpoint) async {
    final response = await dio.delete(endpoint);
    return response;
  }

  @override
  Future<Response> get(String endpoint) async {
    final response = await dio.get(endpoint);
    return response;
  }

  @override
  Future<Response> patch(String endpoint, Map<String, dynamic> data) async {
    final response = await dio.patch(endpoint, data: data);
    return response;
  }

  @override
  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    final response = await dio.post(endpoint, data: data);
    return response;
  }

  @override
  Future<Response> put(String endpoint, Map<String, dynamic> data) async {
    final response = await dio.put(endpoint, data: data);
    return response;
  }
}
