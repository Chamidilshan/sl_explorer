import 'dart:convert';
import 'package:SL_Explorer/constants/constants.dart';
import 'package:SL_Explorer/models/festival_model.dart';
import 'package:flutter/material.dart';
import 'package:SL_Explorer/constants/constants.dart';
import 'package:http/http.dart' as http;


class FestivalApiServices{
  final String apiUrl = '$baseUrl/api/v1/festivals';

  Future<List<Festival>> fetchFestivals() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Festival.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Festival page');
    }
  }

}