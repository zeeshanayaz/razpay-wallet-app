// To parse this JSON data, do
//
//     final generalResponse = generalResponseFromJson(jsonString);

import 'dart:convert';

GeneralResponse generalResponseFromJson(String str) => GeneralResponse.fromJson(json.decode(str));

String generalResponseToJson(GeneralResponse data) => json.encode(data.toJson());

class GeneralResponse {
  String? status;
  String? message;
  String? success;

  GeneralResponse({
    this.status,
    this.message,
    this.success,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) => GeneralResponse(
    status: json['status'],
    message: json['message'],
    success: json['success'],
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'success': success,
  };
}
