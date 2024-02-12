// To parse this JSON data, do
//
//     final trendingResponse = trendingResponseFromJson(jsonString);

import 'dart:convert';

TrendingResponse trendingResponseFromJson(String str) => TrendingResponse.fromJson(json.decode(str));

String trendingResponseToJson(TrendingResponse data) => json.encode(data.toJson());

class TrendingResponse {
  String? status;
  String? message;
  List<Trending>? trending;

  TrendingResponse({
    this.status,
    this.message,
    this.trending,
  });

  factory TrendingResponse.fromJson(Map<String, dynamic> json) => TrendingResponse(
    status: json['status'],
    message: json['message'],
    trending: json['trending'] == null ? [] : List<Trending>.from(json['trending']!.map((x) => Trending.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'trending': trending == null ? [] : List<dynamic>.from(trending!.map((x) => x.toJson())),
  };
}

class Trending {
  int? id;
  String? currency;
  String? icon;
  String? status;
  String? usdValue;
  String? h1;
  String? h2;
  String? h3;
  String? h4;
  String? h5;
  String? h6;
  String? h7;
  String? h8;
  String? createdAt;
  String? updatedAt;

  Trending({
    this.id,
    this.currency,
    this.icon,
    this.status,
    this.usdValue,
    this.h1,
    this.h2,
    this.h3,
    this.h4,
    this.h5,
    this.h6,
    this.h7,
    this.h8,
    this.createdAt,
    this.updatedAt,
  });

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
    id: json['id'],
    currency: json['currency'],
    icon: json['icon'],
    status: json['status'],
    usdValue: json['usd_value'],
    h1: json['h1'],
    h2: json['h2'],
    h3: json['h3'],
    h4: json['h4'],
    h5: json['h5'],
    h6: json['h6'],
    h7: json['h7'],
    h8: json['h8'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'currency': currency,
    'icon': icon,
    'status': status,
    'usd_value': usdValue,
    'h1': h1,
    'h2': h2,
    'h3': h3,
    'h4': h4,
    'h5': h5,
    'h6': h6,
    'h7': h7,
    'h8': h8,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
