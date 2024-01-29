String? emailValidator(String v) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  if (v.isEmpty) {
    return 'Email is empty';
  } else {
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(v)) {
      return null;
    } else {
      return 'Please use a valid email address';
    }
  }
}

String? validatePassword(String v) {
  String pattern = r'^.{8,}$';

  if (v.isEmpty) {
    return 'Password cannot be empty';
  } else {
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(v)) {
      return null;
    } else {
      return 'Password is too short';
    }
  }
}

String? nameValidation(String v) {
  if (v.isEmpty) {
    return 'Name cannot be empty';
  } else {
    return null;
  }
}

String? roleValidation(String v) {
  if (v.isEmpty) {
    return 'Role cannot be empty';
  } else {
    return null;
  }
}

String? bizphoneVal(String v) {
  if (v.trim().isEmpty) {
    return 'Phone is required';
  } else {
    return null;
  }
}

String? fieldValidation(String v) {
  if (v.trim().isEmpty) {
    return 'Field is empty';
  } else {
    return null;
  }
}
