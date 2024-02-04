import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class UserLocation{
  static double lat = 0;
  static double long = 0;
  static String currentLocation = '';

  Future <void> getLocations() async{
    List<Placemark> placeMark = await placemarkFromCoordinates(
        UserLocation.lat,
        UserLocation.long
    );
    currentLocation = placeMark[0].subAdministrativeArea!;
  }


}