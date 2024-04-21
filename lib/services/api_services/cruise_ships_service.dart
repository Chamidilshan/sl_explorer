import 'dart:convert';

import 'package:SL_Explorer/constants/constants.dart';
import 'package:SL_Explorer/models/cruise_ship_packages_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CruiseShipsApiService{

  Future<List<CruiseShip>> fetchCruiseShips() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/CruiseShips'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CruiseShip.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load CruiseShips');
    }
  }

  Future<CruiseShip> fetchCruiseShipsById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/CruiseShips/$id'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return CruiseShip.fromJson(data);
      } catch (e) {
        print('Error parsing response: $e');
        throw e;
      }
    } else {
      throw Exception('Failed to load Cruise Ship by Id');
    }
  }

}