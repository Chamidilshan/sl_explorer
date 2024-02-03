import 'package:SL_Explorer/models/orders_model.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderRequest> _orders = [];
  List<OrderRequest> get orders => _orders;

  void setOrders(List<OrderRequest> orders) {
    _orders = orders;
    notifyListeners();
  }
}
