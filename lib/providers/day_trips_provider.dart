import 'package:SL_Explorer/models/day_trip_packages_model.dart';
import 'package:flutter/material.dart';

class DayTripProvider extends ChangeNotifier {
  List<DayTrip> _dayTrips = [];

  List<DayTrip> get dayTrips => _dayTrips;

  void setDayTrips(List<DayTrip> dayTrips) {
    _dayTrips = dayTrips;
    notifyListeners();
  }
}
