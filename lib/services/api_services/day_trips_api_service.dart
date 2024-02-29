import 'dart:convert';
import 'package:SL_Explorer/constants/constants.dart';
import 'package:SL_Explorer/models/day_trip_packages_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DayTripsApiService{
  final String apiUrl = '$baseUrl/api/v1/dayTrips';

  Future<List<DayTrip>> fetchDayTripsall() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => DayTrip.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load all Day trips');
    }
  }

  Future<List<DayTrip>> fetchDayTrips(String packageDays) async {
    final response = await http.get(Uri.parse('$apiUrl/$packageDays'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => DayTrip.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load day trips by days');
    }
  }
  Future<List<DayTrip>> fetchCategories() async {
    final response = await http.get(Uri.parse('$apiUrl/category'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => DayTrip.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
  Future<List<DayTrip>> fetchDayTripsByCategoryAndDuration(String category, String duration) async {
    final response = await http.get(Uri.parse('$apiUrl/$category/$duration'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => DayTrip.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load day trips for category $category and duration $duration');
    }
  }

}