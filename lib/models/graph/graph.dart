// To parse this JSON data, do
//
//     final graphResponse = graphResponseFromJson(jsonString);

import 'dart:convert';

GraphResponse graphResponseFromJson(String str) => GraphResponse.fromJson(json.decode(str));

String graphResponseToJson(GraphResponse data) => json.encode(data.toJson());

class GraphResponse {
  String? status;
  String? message;
  Graph? graph;

  GraphResponse({
    this.status,
    this.message,
    this.graph,
  });

  factory GraphResponse.fromJson(Map<String, dynamic> json) => GraphResponse(
    status: json["status"],
    message: json["message"],
    graph: json["wallet_address"] == null ? null : Graph.fromJson(json["wallet_address"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "wallet_address": graph?.toJson(),
  };
}

class Graph {
  double? btcUsd;
  double? ethUsd;
  double? usdtUsd;
  double? btcStatus;
  double? ethStatus;
  double? usdtStatus;
  double? total;
  double? status;

  Graph({
    this.btcUsd,
    this.ethUsd,
    this.usdtUsd,
    this.btcStatus,
    this.ethStatus,
    this.usdtStatus,
    this.total,
    this.status,
  });

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
    btcUsd: json["btc_usd"]?.toDouble(),
    ethUsd: json["eth_usd"]?.toDouble(),
    usdtUsd: json["usdt_usd"]?.toDouble(),
    btcStatus: json["btc_status"]?.toDouble(),
    ethStatus: json["eth_status"]?.toDouble(),
    usdtStatus: json["usdt_status"]?.toDouble(),
    total: json["total"]?.toDouble(),
    status: json["status"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "btc_usd": btcUsd,
    "eth_usd": ethUsd,
    "usdt_usd": usdtUsd,
    "btc_status": btcStatus,
    "eth_status": ethStatus,
    "usdt_status": usdtStatus,
    "total": total,
    "status": status,
  };
}
