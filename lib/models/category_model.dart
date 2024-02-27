import 'package:flutter/material.dart';

class Category {
  final String id;
  final String packageCategoryName;
  final String packageCategoryImage;

  Category({
    required this.id,
    required this.packageCategoryName,
    required this.packageCategoryImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    try {
      return Category(
        id: json['_id'],
        packageCategoryName: json['categoryName'],
        packageCategoryImage: json['categoryImage'],
      );
    } catch (e) {
      print('Error parsing DayTrip: $e');
      // Print the JSON data to identify which field is causing the error
      print('JSON data: $json');
      return Category(
        id: '',
        packageCategoryName: '',
        packageCategoryImage: '',
      );
    }
  }
}
