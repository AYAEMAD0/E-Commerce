class ValidatorHelper {

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
    if (!emailValid) return 'Invalid email';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 6) return "Password must be at least 6 chars";
    return null;
  }
  static String? validateConfirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) return 'Confirm Password is required';
    if (value != originalPassword) return 'Passwords do not match';
    return null;
  }
}

