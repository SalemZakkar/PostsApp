class Validator {
  static checkString(String txt) {
    return RegExp(r"[A-z]").hasMatch(txt);
  }
}
