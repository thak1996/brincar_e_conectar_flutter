import 'package:dio/dio.dart';

abstract class IService {
  Future<Response> get(String endpoint);
  Future<Response> post(String endpoint, Map<String, dynamic> data);
  Future<Response> put(String endpoint, Map<String, dynamic> data);
  Future<Response> delete(String endpoint);
  Future<Response> patch(String endpoint, Map<String, dynamic> data);
}
