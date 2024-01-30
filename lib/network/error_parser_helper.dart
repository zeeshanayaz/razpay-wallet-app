import 'dart:convert';

class ErrorParserHelper {
  static errorParser(String err) {
    var decodedError = jsonDecode(err)['message'];
    if (decodedError.runtimeType == String) {
      return decodedError;
    }
    var error = decodedError['email'] ??
        decodedError['password'];
    return error[0];
  }
}
