class Validation {
  static String? validateMobile(String value) {
    String pattern = r'(84|0)([3|5|7|8|9])+([0-9]{8})\b';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static bool isValidatedMobile(String value) {
    String pattern = r'(84|0)([3|5|7|8|9])+([0-9]{8})\b';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String? validateName(String name) {
    if ((name.length > 0 && name.length < 6) || name.length > 30) {
      return "*Name must be between 6 - 30 characters";
    } else if (name.length == 0) {
      return "*Please enter your first & last name";
    }
    return null;
  }

  static String? validateConfirmPassword(String password, String confPassword) {
    if (password != confPassword) {
      return "*Password incorrect";
    }else if (confPassword.length == 0) {
      return "*Please enter your confirm password";
    }
    return null;
  }

  static String? validatePassword(String password){
    if ((password.length > 0 && password.length < 8) || password.length > 16) {
      return "*Password must be between 8 - 16 characters";
    } else if (password.length == 0) {
      return "*Please enter your password";
    }
    return null;
  }
}
