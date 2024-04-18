import 'package:flutter/material.dart';

class A_Z {
  final String id;
  final String mainTopic;
  final List<String> description;
  final String topicCoverImage;

  A_Z({
    required this.id,
    required this.mainTopic,
    required this.description,
    required this.topicCoverImage,

  });

  factory A_Z.fromJson(Map<String, dynamic> json) {
    return A_Z(
      id: json['_id'],
      mainTopic: json['mainTopic'],
      description: List<String>.from(json['description']),
      topicCoverImage: json['topicCoverImage'],
    );
  }
}
