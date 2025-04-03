abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, [this.statusCode]);

  @override
  String toString() => message;

  static AppException fromStatusCode(int? statusCode, String message) {
    switch (statusCode) {
      case 400:
        return ValidationException(message, statusCode);
      case 401:
        return UnauthorizedException(message, statusCode);
      case 404:
        return NotFoundException(message, statusCode);
      case 500:
        return ServerException(message, statusCode);
      case 503:
        return NetworkException('Serviço indisponível: $message', statusCode);
      default:
        return GeneralException(message, statusCode);
    }
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
  ValidationException._(super.message, [super.statusCode]);

  factory ValidationException(String message, [int? statusCode]) {
    switch (message) {
      case 'Campo obrigatório':
        return ValidationException._('O campo é obrigatório.', statusCode);
      case 'Formato inválido':
        return ValidationException._(
          'O formato fornecido é inválido.',
          statusCode,
        );
      case 'Valor fora do limite':
        return ValidationException._(
          'O valor está fora do limite permitido.',
          statusCode,
        );
      default:
        return ValidationException._(message, statusCode);
    }
  }
}

class ServerException extends AppException {
  ServerException._(super.message, [super.statusCode]);

  factory ServerException(String message, [int? statusCode]) {
    switch (message) {
      case 'Erro interno do servidor':
        return ServerException._(
          'Ocorreu um erro interno no servidor.',
          statusCode,
        );
      case 'Service unavailable':
        return ServerException._(
          'O serviço está temporariamente indisponível.',
          statusCode,
        );
      default:
        return ServerException._(message, statusCode);
    }
  }
}
