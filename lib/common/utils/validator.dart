class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r'((\ *)[\wáéíóúñ]+(\ *)+)+');

    if (value != null && value.isEmpty) {
      return "Your name is required.";
    }

    if (value != null && !condition.hasMatch(value)) {
      return "Invalid name. Enter a valid name.";
    }

    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value != null && value.isEmpty) {
      return "Your email is required.";
    }

    if (value != null && !condition.hasMatch(value)) {
      return "Invalid email. Enter a valid email.";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    final condition =
        RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');

    if (value != null && value.isEmpty) {
      return "Your password is required.";
    }

    if (value != null && !condition.hasMatch(value)) {
      return "Invalid password. Enter a valid password.";
    }

    return null;
  }

  static String? validateConfirmPassword(String? first, String? second) {
    if (second != null && second.isEmpty) {
      return "Your password is required.";
    }

    if (first != second) {
      return "Passwords do not match. Please try again.";
    }

    return null;
  }
}
