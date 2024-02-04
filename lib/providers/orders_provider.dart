import 'package:SL_Explorer/models/orders_model.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orders = [];
  List<Order> get orders => _orders;

  void setOrders(List<Order> orders) {
    _orders = orders;
    notifyListeners();
  }
}
