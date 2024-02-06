import 'package:SL_Explorer/common/snackbar.dart';
import 'package:SL_Explorer/constants/constants.dart';
import 'package:SL_Explorer/features/home/bottom_navigation.dart';
import 'package:SL_Explorer/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderApiService {

  final String apiUrl = '$baseUrl/api/v1/orders';


  Future<bool> placeOrder(OrderRequest order, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(order.toJson()),
      );

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 201) {
        // Order successfully placed
        CommonLoaders.successSnackBar(
            title: 'Congradualtions',
            duration: 4,
            message: 'Your order was made successfully. Please wait for a confirmation'
        );
        Get.offAll(bottomNavigationBar());
        return true;
      } else {
        CommonLoaders.errorSnackBar(
            title: 'Something went wrong',
            duration: 4,
            message: 'Please try again'
        );
        return false;
      }
    } catch (e) {
      CommonLoaders.errorSnackBar(
          title: 'Something went wrong',
          duration: 4,
          message: e.toString()
      );
      print('Error placing order: $e');
      return false;
    }
  }


  Future<List<Order>> fetchOrders(String _uid) async {
    final response = await http.get(Uri.parse('$apiUrl/$_uid'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load round trips');
    }
  }


  Future<bool> postOrderReference(String orderId, String reference) async {
    final String refUrl = '$apiUrl/reference';

    // Create the JSON body
    final jsonBody = {
      'orderId': orderId,
      'reference': reference,
    };

    try {
      final response = await http.post(
        Uri.parse(refUrl),
        body: json.encode(jsonBody),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Order reference created successfully');
        return true;
      } else {
        print('Failed to create order reference. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (error) {
      print('Error creating order reference: $error');
      return false;
    }
  }


}


