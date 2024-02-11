// To parse this JSON data, do
//
//     final transactionDetailResponse = transactionDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'transaction.dart';

TransactionDetailResponse transactionDetailResponseFromJson(String str) => TransactionDetailResponse.fromJson(json.decode(str));

String transactionDetailResponseToJson(TransactionDetailResponse data) => json.encode(data.toJson());

class TransactionDetailResponse {
  String? status;
  String? message;
  Transaction? transactionHistory;

  TransactionDetailResponse({
    this.status,
    this.message,
    this.transactionHistory,
  });

  factory TransactionDetailResponse.fromJson(Map<String, dynamic> json) => TransactionDetailResponse(
    status: json['status'],
    message: json['message'],
    transactionHistory: json['transaction_history'] == null ? null : Transaction.fromJson(json['transaction_history']),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'transaction_history': transactionHistory?.toJson(),
  };
}
