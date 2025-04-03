abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, [this.statusCode]);

  @override
  String toString() {
    return 'AppException: $message (statusCode: $statusCode)';
  }
}

class GeneralException extends AppException {
  GeneralException(super.message, [super.statusCode]);
}

class NetworkException extends AppException {
  NetworkException(super.message, [super.statusCode]);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(super.message, [super.statusCode]);
}

class NotFoundException extends AppException {
  NotFoundException(super.message, [super.statusCode]);
}

class ValidationException extends AppException {
  ValidationException(super.message, [super.statusCode]);
}

class ServerException extends AppException {
  ServerException(super.message, [super.statusCode]);
}
