abstract class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}

class GeneralException extends AppException {
  GeneralException(super.message);
}
