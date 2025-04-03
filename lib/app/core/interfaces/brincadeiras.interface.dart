import 'package:brincar_e_conectar_flutter/app/models/brincadeiras.dart';
import 'package:result_dart/result_dart.dart';

abstract class IBrincadeirasService {
  AsyncResult<List<Brincadeiras>> getAllBrincadeiras();
  AsyncResult<void> delBrincadeira(int id);
}
