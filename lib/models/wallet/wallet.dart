// To parse this JSON data, do
//
//     final walletResponse = walletResponseFromJson(jsonString);

import 'dart:convert';

WalletResponse walletResponseFromJson(String str) => WalletResponse.fromJson(json.decode(str));

String walletResponseToJson(WalletResponse data) => json.encode(data.toJson());

class WalletResponse {
  String? status;
  String? message;
  List<WalletAddress>? walletAddress;

  WalletResponse({
    this.status,
    this.message,
    this.walletAddress,
  });

  factory WalletResponse.fromJson(Map<String, dynamic> json) => WalletResponse(
    status: json['status'],
    message: json['message'],
    walletAddress: json['wallet_address'] == null ? [] : List<WalletAddress>.from(json['wallet_address']!.map((x) => WalletAddress.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'wallet_address': walletAddress == null ? [] : List<dynamic>.from(walletAddress!.map((x) => x.toJson())),
  };
}

class WalletAddress {
  int? id;
  int? userId;
  String? currency;
  String? address;
  double? balance;
  double? manualBalance;
  double? pendingBalance;
  double? oldBalance;
  double? totalBalance;
  String? createdAt;
  String? updatedAt;
  double? usd;
  String? status;

  WalletAddress({
    this.id,
    this.userId,
    this.currency,
    this.address,
    this.balance,
    this.manualBalance,
    this.pendingBalance,
    this.oldBalance,
    this.totalBalance,
    this.createdAt,
    this.updatedAt,
    this.usd,
    this.status,
  });

  factory WalletAddress.fromJson(Map<String, dynamic> json) => WalletAddress(
    id: json['id'],
    userId: json['user_id'],
    currency: json['currency'],
    address: json['address'],
    balance: json['balance']?.toDouble(),
    manualBalance: json['manual_balance']?.toDouble(),
    pendingBalance: json['pending_balance']?.toDouble(),
    oldBalance: json['old_balance']?.toDouble(),
    totalBalance: json['total_balance']?.toDouble(),
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    usd: json['usd']?.toDouble(),
    status: json['status'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'currency': currency,
    'address': address,
    'balance': balance,
    'manual_balance': manualBalance,
    'pending_balance': pendingBalance,
    'old_balance': oldBalance,
    'total_balance': totalBalance,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'usd': usd,
    'status': status,
  };
}
