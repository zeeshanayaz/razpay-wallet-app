// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

Transaction transactionFromJson(String str) => Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

List<Transaction> transactionListFromJson(String str) => List<Transaction>.from(json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionListToJson(List<Transaction> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
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

  Transaction({
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

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
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
}
