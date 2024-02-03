import 'package:SL_Explorer/models/round_trip_packages_model.dart';
import 'package:flutter/material.dart';

class RoundTripProvider extends ChangeNotifier {
  List<RoundTrip> _roundTrips = [];

  List<RoundTrip> get roundTrips => _roundTrips;

  void setRoundTrips(List<RoundTrip> trips) {
    _roundTrips = trips;
    notifyListeners();
  }
}
