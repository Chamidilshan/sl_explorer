import 'package:SL_Explorer/models/wishlist_model.dart';
import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  List<String> _wishlist = [];
  List<String> get wishes => _wishlist;

  void setWishlists(List<String> wishes) {
    _wishlist = wishes;
    notifyListeners();
  }
}