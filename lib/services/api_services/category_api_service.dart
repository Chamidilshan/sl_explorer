import 'dart:convert';

import 'package:SL_Explorer/constants/constants.dart';
import 'package:SL_Explorer/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CategoryApiService{

  Future<List<Category>> fetchCategory() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/dayTips/category'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load round trips');
    }
  }

}