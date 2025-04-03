class Validator {
  /// Valida se o campo não está vazio
  static String? validateRequiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName é obrigatório.';
    }
    return null;
  }

  /// Valida se o valor é um número válido
  static String? validateNumber(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName é obrigatório.';
    }
    if (double.tryParse(value) == null) {
      return '$fieldName deve ser um número válido.';
    }
    return null;
  }
}