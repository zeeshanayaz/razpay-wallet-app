// To parse this JSON data, do
//
//     final transactionHistoryResponse = transactionHistoryResponseFromJson(jsonString);

import 'dart:convert';

import 'transaction.dart';

TransactionHistoryResponse transactionHistoryResponseFromJson(String str) => TransactionHistoryResponse.fromJson(json.decode(str));

String transactionHistoryResponseToJson(TransactionHistoryResponse data) => json.encode(data.toJson());

class TransactionHistoryResponse {
  String? status;
  String? message;
  List<Transaction>? transactionHistory;

  TransactionHistoryResponse({
    this.status,
    this.message,
    this.transactionHistory,
  });

  factory TransactionHistoryResponse.fromJson(Map<String, dynamic> json) => TransactionHistoryResponse(
    status: json['status'],
    message: json['message'],
    transactionHistory: json['transaction_history'] == null ? [] : List<Transaction>.from(json['transaction_history']!.map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'transaction_history': transactionHistory == null ? [] : List<dynamic>.from(transactionHistory!.map((x) => x.toJson())),
  };
}

/*class TransactionHistory {
  int? id;
  int? userId;
  String? coinId;
  String? tnxid;
  String? address;
  double? amount;
  int? confirmations;
  double? fees;
  double? rate;
  String? category;
  double? oldBalance;
  double? newBalance;
  String? type;
  int? isPending;
  String? createdAt;
  String? updatedAt;
  bool? btn;

  TransactionHistory({
    this.id,
    this.userId,
    this.coinId,
    this.tnxid,
    this.address,
    this.amount,
    this.confirmations,
    this.fees,
    this.rate,
    this.category,
    this.oldBalance,
    this.newBalance,
    this.type,
    this.isPending,
    this.createdAt,
    this.updatedAt,
    this.btn,
  });

  factory TransactionHistory.fromJson(Map<String, dynamic> json) => TransactionHistory(
    id: json['id'],
    userId: json['user_id'],
    coinId: json['coin_id'],
    tnxid: json['tnxid'],
    address: json['address'],
    amount: json['amount']?.toDouble(),
    confirmations: json['confirmations'],
    fees: json['fees']?.toDouble(),
    rate: json['rate']?.toDouble(),
    category: json['category'],
    oldBalance: json['old_balance']?.toDouble(),
    newBalance: json['new_balance']?.toDouble(),
    type: json['type'],
    isPending: json['is_pending'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    btn: json['btn'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'coin_id': coinId,
    'tnxid': tnxid,
    'address': address,
    'amount': amount,
    'confirmations': confirmations,
    'fees': fees,
    'rate': rate,
    'category': category,
    'old_balance': oldBalance,
    'new_balance': newBalance,
    'type': type,
    'is_pending': isPending,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'btn': btn,
  };
}*/
