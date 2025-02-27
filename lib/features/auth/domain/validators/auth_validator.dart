
///Returning null means the input is valid.
///Otherwise, an error is returned.
class AuthValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    
    // At least 6 characters
    if (value.length < 6) return 'At least 6 characters';
    
    // Contains at least one uppercase letter
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Must include an uppercase letter';
    }
    
    // Contains at least one lowercase letter
    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Must include a lowercase letter';
    }
    
    // Contains at least one number
    if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
      return 'Must include a number';
    }
    
    return null;
  }
}