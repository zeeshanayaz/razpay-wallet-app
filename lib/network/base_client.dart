import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:http/http.dart' as http;
import '../core/constant.dart';
import '../core/utils/shared_pref.dart';
import 'api_constants.dart';
import 'app_exceptions.dart';
import 'error_parser_helper.dart';

class BaseClient {
  //GET
  Future<dynamic> get(String endPoint) async {
    final String token = await SharedPref.getString(kToken) ?? '';
    var uri = Uri.parse(ApiConstants.baseUrl + endPoint);
    try {
      if (kDebugMode) print('API Calling $uri');

      var response = await http.get(uri,
        headers: {
          "Authorization": "Bearer $token",
          "content-type": "application/json"
        },).timeout(const Duration(seconds: ApiConstants.timeOutDuration));

      if (kDebugMode) print('API: $uri Response Status Code ${response.statusCode}');

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(ApiConstants.networkErrorMessage, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(ApiConstants.timeOutErrorMessage, uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String endPoint, [dynamic payloadObj, dynamic queryParameters]) async {
    final String token = await SharedPref.getString(kToken) ?? '';
    var uri = Uri.parse(ApiConstants.baseUrl + endPoint);
    var payload = jsonEncode(payloadObj);
    try {
      if (kDebugMode) print('API Calling $uri');

      var response = await http.post(uri,
          headers: {
            "Authorization": "Bearer $token",
            "content-type": "application/json"
          },
          body: payload).timeout(const Duration(seconds: ApiConstants.timeOutDuration));

      if (kDebugMode) print('API: $uri Response Status Code ${response.statusCode}');

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(ApiConstants.networkErrorMessage, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(ApiConstants.timeOutErrorMessage, uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        // var responseJson = utf8.decode(response.bodyBytes);
        // return responseJson;
        var message = ErrorParserHelper.errorParser(utf8.decode(response.bodyBytes));
        throw BadRequestException(message, response.request!.url.toString());
      case 400:
        var message = ErrorParserHelper.errorParser(utf8.decode(response.bodyBytes));
        throw BadRequestException(message, response.request!.url.toString());
      case 401:
        SharedPref.logout();
        return;
      case 403:
      case 406:
        var message = ErrorParserHelper.errorParser(utf8.decode(response.bodyBytes));
        throw UnAuthorizedException(message, response.request!.url.toString());
      case 422:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred with code : ${response.statusCode}', response.request!.url.toString());
    }
  }
}