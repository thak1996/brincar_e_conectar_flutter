import 'package:result_dart/result_dart.dart';
import '../../models/brincadeiras.dart';
import '../interfaces/brincadeiras.interface.dart';
import '../utils/exceptions.dart';
import 'service.dart';

class BrincadeirasService extends BaseService implements IBrincadeirasService {
  BrincadeirasService();

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
      return Failure(
        e is AppException ? e : GeneralException('Erro inesperado: $e'),
      );
    }
  }

  String get parseUrl => "/brincadeiras";
}
