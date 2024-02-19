import 'package:SL_Explorer/models/festival_model.dart';
import 'package:flutter/material.dart';

class FestivalProvider extends ChangeNotifier {
  List<Festival> _festivals = [];

  List<Festival> get festivals => _festivals;

  void setFestivals(List<Festival> fest) {
    _festivals = fest;
    notifyListeners();
  }
}