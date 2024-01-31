// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  String? status;
  String? message;
  Profile? profile;

  ProfileResponse({
    this.status,
    this.message,
    this.profile,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    status: json['status'],
    message: json['message'],
    profile: json['data'] == null ? null : Profile.fromJson(json['data']),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': profile?.toJson(),
  };
}

class Profile {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? country;
  String? pin;
  String? role;
  dynamic emailVerifiedAt;
  String? status;
  String? kyc;
  String? avatar;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? token;

  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.country,
    this.pin,
    this.role,
    this.emailVerifiedAt,
    this.status,
    this.kyc,
    this.avatar,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json['id'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    email: json['email'],
    country: json['country'],
    pin: json['pin'],
    role: json['role'],
    emailVerifiedAt: json['email_verified_at'],
    status: json['status'],
    kyc: json['kyc'],
    avatar: json['avatar'],
    isDeleted: json['is_deleted'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    token: json['token'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'country': country,
    'pin': pin,
    'role': role,
    'email_verified_at': emailVerifiedAt,
    'status': status,
    'kyc': kyc,
    'avatar': avatar,
    'is_deleted': isDeleted,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'token': token,
  };
}
