import 'package:SL_Explorer/models/wishlist_model.dart';
import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  List<Wishlist> _wishlist = [];
  List<Wishlist> get wishes => _wishlist;

  void setOrders(List<Wishlist> wishes) {
    _wishlist = wishes;
    notifyListeners();
  }
}