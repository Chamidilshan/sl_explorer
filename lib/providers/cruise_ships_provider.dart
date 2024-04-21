import 'package:SL_Explorer/models/cruise_ship_packages_model.dart';
import 'package:flutter/material.dart';

class CruiseShipProvider extends ChangeNotifier {
  List<CruiseShip> _cruiseShips = [];

  List<CruiseShip> get cruiseShips => _cruiseShips;

  void setCruiseShips(List<CruiseShip> trips) {
    _cruiseShips = trips;
    notifyListeners();
  }
}
