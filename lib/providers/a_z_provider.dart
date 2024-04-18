import 'package:SL_Explorer/models/a_z_model.dart';
import 'package:SL_Explorer/models/festival_model.dart';
import 'package:flutter/material.dart';

class A_ZProvider extends ChangeNotifier {
  List<A_Z> _a_zs = [];

  List<A_Z> get a_zs => _a_zs;

  void setA_Zs(List<A_Z> az) {
    _a_zs = az;
    notifyListeners();
  }
}