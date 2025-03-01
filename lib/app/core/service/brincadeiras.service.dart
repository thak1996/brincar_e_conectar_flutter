import 'dart:convert';
import 'package:result_dart/result_dart.dart';
import '../../models/brincadeiras.dart';
import '../interfaces/brincadeiras.interface.dart';
import '../utils/exceptions.dart';
import 'service.dart';

class BrincadeirasService extends BaseService implements IBrincadeirasService {
  BrincadeirasService();

  @override
  AsyncResult<List<Brincadeiras>> getBrincadeiras() async {
    try {
      final response = await get(parseUrl);
      final brincadeiras =
          (json.decode(response.data)['brincadeiras'] as List)
              .map((json) => Brincadeiras.fromMap(json))
              .toList();
      return Success(brincadeiras);
    } catch (e) {
      return Failure(GeneralException('Erro ao carregar as brincadeiras: $e'));
    }
  }

  String get parseUrl => "/brincadeiras.json";
}
