import 'dart:convert';
import 'package:SL_Explorer/constants/constants.dart';
import 'package:SL_Explorer/models/day_trip_packages_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DayTripsApiService{
  final String apiUrl = '$baseUrl/api/v1/dayTrips';

  Future<List<DayTrip>> fetchDayTrips(String packageDays) async {
    final response = await http.get(Uri.parse('$apiUrl/$packageDays'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => DayTrip.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load day trips');
    }
  }

}