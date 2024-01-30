import 'dart:convert';

class ErrorParserHelper {
  static errorParser(String err) {
    dynamic decodedError;
    if(jsonDecode(err).containsKey('message')) {
      decodedError = jsonDecode(err)['message'];
    } else {
      decodedError = jsonDecode(err)['error'];
    }
    if (decodedError.runtimeType == String) {
      return decodedError;
    }
    var error = decodedError['email'] ??
        decodedError['password'];
    return error[0];
  }
}
