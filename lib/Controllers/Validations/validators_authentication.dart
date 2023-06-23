import 'regex.dart';

class EntriesValidator {
  static String? validateUsername(String? user) {
    if (user == null || user.isEmpty) {
      return "Campo Obrigatório";
    }
    // Removendo os espaços em branco no começo e no final de "password"
    user = user.trim();
    if (user.isInvalidUser()) {
      return "Nome de Usuário inválido";
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Campo Obrigatório";
    }
    // Removendo os espaços em branco no começo e no final de "password"
    email = email.trim();
    if (email.isInvalidEmail()) {
      return "Email inválido";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Campo Obrigatório";
    }
    // Removendo os espaços em branco no começo e no final de "password"
    password = password.trim();
    if (password.isInvalidPassword().isEmpty) {
      return null;
    }
    return password.isInvalidPassword().first;
  }

  static String? validateConfirmPassword({required String? confirmPassword, required String? password}) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Campo Obrigatório";
    }
    // Removendo os espaços em branco no começo e no final de "password"
    confirmPassword = confirmPassword.trim();
    if (confirmPassword == password!.trim()) {
      return null;
    }
    return "As senhas não coincidem";
  }

  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Campo Obrigatório";
    }
    // Removendo os espaços em branco no começo e no final de "password"
    phone = phone.trim();
    if (phone.isInvalidPhone()) {
      return "Número de Telefone inválido";
    }
    return null;
  }
}
