import 'package:flutter/material.dart';

class Festival {
  final String id;
  final String festivalName;
  final String festivalDescription;
  final String festivalCoverImage;
  final List<String> festivalImageLinks;
  final String festivalTitle;
  final String festivalDate;


  Festival({
    required this.id,
    required this.festivalName,
    required this.festivalDescription,
    required this.festivalCoverImage,
    required this.festivalImageLinks,
    required this.festivalTitle,
    required this.festivalDate,
  });

  factory Festival.fromJson(Map<String, dynamic> json) {
    return Festival(
      id: json['_id'],
      festivalName: json['festivalName'],
      festivalDescription: json['festivalDescription'],
      festivalCoverImage: json['festivalCoverImage'],
      festivalImageLinks: List<String>.from(json['festivalImageLinks']),
      festivalTitle: json['festivalTitle'],
      festivalDate: json['festivalDate'],
    );
  }
}

