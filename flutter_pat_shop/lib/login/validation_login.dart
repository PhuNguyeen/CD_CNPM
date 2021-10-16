class ValidationLogin{
  static String? validateMobile(String value) {
    String pattern = r'(84|0[3|5|7|8|9])+([0-9]{8})\b';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}