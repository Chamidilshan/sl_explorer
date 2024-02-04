import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class NotificationModel {
  final String id;
  final String title;
  final String body;
  final String imgLink;
  final String date;
  final String time;

  NotificationModel({
    required this.title,
    required this.body,
    required this.imgLink,
    required this.date,
    required this.time,
  }) : id = Uuid().v4();

  NotificationModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        body = json['body'],
        id = json['id'],
        imgLink = json['imgLink'],
        date = json['date'],
        time = json['time'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'body': body,
    'id': id,
    'imgLink': imgLink,
    'date': date,
    'time': time,
  };
}
