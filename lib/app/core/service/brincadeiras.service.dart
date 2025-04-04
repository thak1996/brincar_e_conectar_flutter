import 'package:result_dart/result_dart.dart';
import '../../models/brincadeiras.dart';
import '../interfaces/brincadeiras.interface.dart';
import '../utils/exceptions.dart';
import 'service.dart';

class BrincadeirasService extends BaseService implements IBrincadeirasService {
  BrincadeirasService();

  String get parseUrl => "/brincadeiras";

  @override
  AsyncResult<List<Brincadeiras>> getAllBrincadeiras() async {
    try {
      final response = await get(parseUrl);
      final responseData = response.data;
      final brincadeiras =
          (responseData['data'] as List)
              .map((item) => Brincadeiras.fromMap(item))
              .toList();
      return Success(brincadeiras);
    } catch (e) {
      return Failure(ServerException(e.toString()));
    }
  }

  @override
  AsyncResult<void> delBrincadeira(int id) async {
    try {
      final response = await delete('$parseUrl/$id');
      final responseData = response.data as Map<String, dynamic>;
      if (responseData['success'] != true) {
        throw ValidationException(
          responseData['message'] ?? 'Erro ao deletar a brincadeira.',
          response.statusCode,
        );
      }
      return Success('Brincadeira deletada com sucesso!');
    } catch (e) {
      return Failure(ServerException(e.toString()));
    }
  }

  @override
  AsyncResult<String> editBrincadeira(Brincadeiras brincadeira) async {
    try {
      final response = await put(
        '$parseUrl/${brincadeira.id}',
        brincadeira.toMap(),
      );
      final responseData = response.data as Map<String, dynamic>;
      if (responseData['success'] != true) {
        throw ValidationException(
          responseData['message'] ?? 'Erro ao editar a brincadeira.',
          response.statusCode,
        );
      }
      return Success('Brincadeira editada com sucesso!');
    } catch (e) {
      return Failure(ServerException(e.toString()));
    }
  }

  @override
  AsyncResult<String> addBrincadeira(Brincadeiras brincadeira) async {
    try {
      final response = await post(parseUrl, brincadeira.toMap());
      final responseData = response.data as Map<String, dynamic>;
      if (responseData['success'] != true) {
        throw ValidationException(
          responseData['message'] ?? 'Erro ao adicionar a brincadeira.',
          response.statusCode,
        );
      }
      return Success('Brincadeira adicionada com sucesso!');
    } catch (e) {
      return Failure(ServerException(e.toString()));
    }
  }
}
