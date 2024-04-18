import 'dart:convert';
import 'package:SL_Explorer/constants/constants.dart';
import 'package:SL_Explorer/models/a_z_model.dart';
import 'package:SL_Explorer/models/a_z_model.dart';
import 'package:flutter/material.dart';
import 'package:SL_Explorer/constants/constants.dart';
import 'package:http/http.dart' as http;


class A_ZApiServices{
  final String apiUrl = '$baseUrl/api/v1/a_z';

  Future<List<A_Z>> fetchA_Zs() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => A_Z.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Sri Lanka A_Z page');
    }
  }

}