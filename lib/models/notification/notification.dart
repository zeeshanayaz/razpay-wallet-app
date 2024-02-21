// To parse this JSON data, do
//
//     final notificationResponse = notificationResponseFromJson(jsonString);

import 'dart:convert';

NotificationResponse notificationResponseFromJson(String str) => NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) => json.encode(data.toJson());

class NotificationResponse {
  String? status;
  String? message;
  int? unseen;
  List<Notification>? notifications;

  NotificationResponse({
    this.status,
    this.message,
    this.unseen,
    this.notifications,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) => NotificationResponse(
    status: json['status'],
    message: json['message'],
    unseen: json['unseen'],
    notifications: json['notifications'] == null ? [] : List<Notification>.from(json['notifications']!.map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'unseen': unseen,
    'notifications': notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class Notification {
  int? id;
  dynamic userId;
  String? title;
  String? description;
  dynamic seen;
  dynamic favourite;
  String? createdAt;
  String? updatedAt;

  Notification({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.seen,
    this.favourite,
    this.createdAt,
    this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json['id'],
    userId: json['user_id'],
    title: json['title'],
    description: json['description'],
    seen: json['seen'],
    favourite: json['favourite'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'title': title,
    'description': description,
    'seen': seen,
    'favourite': favourite,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
