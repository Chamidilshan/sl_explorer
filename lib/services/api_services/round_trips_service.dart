import 'dart:convert';

import 'package:SL_Explorer/constants/constants.dart';
import 'package:SL_Explorer/models/round_trip_packages_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RoundTripsApiService{

  Future<List<RoundTrip>> fetchRoundTrips() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/roundTrips'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
     try{
       final List<dynamic> data = jsonDecode(response.body);
       return data.map((json) => RoundTrip.fromJson(json)).toList();
     }catch(e){
       print('hello');
       print(e);
       throw e;
     }
    } else { 
      throw Exception('Failed to load round trips');
    }
  }

  Future<RoundTrip> fetchRoundTripsById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/roundTrips/$id'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return RoundTrip.fromJson(data); // Assuming RoundTrip.fromJson is used to parse a single object
      } catch (e) {
        print('Error parsing response: $e');
        throw e;
      }
    } else {
      throw Exception('Failed to load round trip by Id');
    }
  }


}