import 'package:SL_Explorer/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _category = [];

  List<Category> get category => _category;

  void setCategory(List<Category> category) {
    _category = category;
    notifyListeners();
  }
}