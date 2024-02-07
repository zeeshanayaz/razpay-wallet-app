// To parse this JSON data, do
//
//     final marketResponse = marketResponseFromJson(jsonString);

import 'dart:convert';

MarketResponse marketResponseFromJson(String str) => MarketResponse.fromJson(json.decode(str));

String marketResponseToJson(MarketResponse data) => json.encode(data.toJson());

class MarketResponse {
  String? status;
  String? message;
  List<Market>? market;
  MarketCap? marketCap;

  MarketResponse({
    this.status,
    this.message,
    this.market,
    this.marketCap,
  });

  factory MarketResponse.fromJson(Map<String, dynamic> json) => MarketResponse(
    status: json['status'],
    message: json['message'],
    market: json['market'] == null ? [] : List<Market>.from(json['market']!.map((x) => Market.fromJson(x))),
    marketCap: json['market_cap'] == null ? null : MarketCap.fromJson(json['market_cap']),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'market': market == null ? [] : List<dynamic>.from(market!.map((x) => x.toJson())),
    'market_cap': marketCap?.toJson(),
  };
}

class Market {
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
  DateTime? createdAt;
  DateTime? updatedAt;

  Market({
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

  factory Market.fromJson(Map<String, dynamic> json) => Market(
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
    createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
    updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
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
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}

class MarketCap {
  int? id;
  String? currency;
  String? status;
  String? cap;
  String? volume;
  String? rank;
  DateTime? createdAt;
  DateTime? updatedAt;

  MarketCap({
    this.id,
    this.currency,
    this.status,
    this.cap,
    this.volume,
    this.rank,
    this.createdAt,
    this.updatedAt,
  });

  factory MarketCap.fromJson(Map<String, dynamic> json) => MarketCap(
    id: json['id'],
    currency: json['currency'],
    status: json['status'],
    cap: json['cap'],
    volume: json['volume'],
    rank: json['rank'],
    createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
    updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'currency': currency,
    'status': status,
    'cap': cap,
    'volume': volume,
    'rank': rank,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
