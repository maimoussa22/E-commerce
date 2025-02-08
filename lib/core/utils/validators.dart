class Validators{

  static String? validateEmail(String? value) {
    RegExp emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    else if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }else {
      return null;
    }
  }

  static String? validateName(String? value) {
    RegExp nameRegex = RegExp(r'^[a-zA-Z0-9._%+-]+$');
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    else if (!nameRegex.hasMatch(value)) {
      return 'Enter a valid name';
    }else {
      return null;
    }
  }

  static String? validatePhone(String? value) {
    RegExp phoneRegex = RegExp(r'^\d{11}$');

    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    else if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid 11-digit phone number';
    }else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    // RegExp passwordRegex = RegExp("r'^(?=.*[a-zA-Z])(?=.*[0-9])");
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    else if ( value.length < 8) {
      return 'Strong password please';
    }
    return null;
  }

  static String? validateRePassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Re-enter your password';
    }
    else if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}