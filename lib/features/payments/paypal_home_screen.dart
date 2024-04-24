import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:SL_Explorer/common/snackbar.dart';
import 'package:SL_Explorer/constants/constants.dart';
import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:SL_Explorer/features/home/bottom_navigation.dart';
import 'package:SL_Explorer/features/payments/payment_screen.dart';
import 'package:SL_Explorer/models/orders_model.dart';
import 'package:SL_Explorer/services/api_services/orders_api_service.dart';
import 'package:SL_Explorer/services/payment_service/stripe_service.dart';

class PaypalHomeScreen extends StatefulWidget {
  final Order order;
  final String packageName;
  final DateTime date;
  final String adultCount;
  final String childCount;

  const PaypalHomeScreen({
    Key? key,
    required this.packageName,
    required this.date,
    required this.adultCount,
    required this.childCount,
    required this.order,
  }) : super(key: key);

  @override
  State<PaypalHomeScreen> createState() => _PaypalHomeScreenState();
}

class _PaypalHomeScreenState extends State<PaypalHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  OrderApiService apiService = OrderApiService();

  static Future<void> updateOrderStatus(String orderId, String status) async {
    final String apiUrl = '$baseUrl/api/v1/orders/status';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final Map<String, String> body = {
      'orderId': orderId,
      'status': status,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print('Order status updated successfully');
      } else {
        print('Failed to update order status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating order status: $error');
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        Get.offAll(() => bottomNavigationBar());

        await updateOrderStatus(widget.order.orderId, 'Confirmed');

        CommonLoaders.successSnackBar(
          title: 'Payment Success',
          duration: 4,
          message:
          'The advance payment has been successfully processed. Thank you for your transaction',
        );
      });
    } on Exception catch (e) {
      if (e is StripeException) {
        print(e);
        CommonLoaders.errorSnackBar(
          title: 'Something went wrong',
          duration: 4,
          message: '${e.error.localizedMessage}',
        );
      } else {
        CommonLoaders.errorSnackBar(
          title: 'Something went wrong',
          duration: 4,
          message: 'Unforeseen error: ${e}',
        );
        print(e);
      }
    }
  }

  Future<void> makePayment(BuildContext context) async {
    try {
      final paymentIntentData = await createPaymentIntent(
          widget.order.advance!.amount.toString(), 'USD') ??
          {};

      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret:
            paymentIntentData!['client_secret'], //Gotten from payment intent
            style: ThemeMode.dark,
            merchantDisplayName: 'Ikay',
          ))
          .then((value) {
        displayPaymentSheet();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              widget.packageName,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${widget.adultCount} Adults | ${widget.childCount} Children',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${widget.date.year}-${widget.date.month}-${widget.date.day}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30), // Add space between text and payment button
            Text(
              'Select Payment Method',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.credit_card, color: logoColor),
                  SizedBox(width: 10),
                  Text(
                    'Credit Card',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.payment, color: logoColor),
                  SizedBox(width: 10),
                  Text(
                    'PayPal',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(), // Add space to push payment button to the bottom
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: 48.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: logoColor.withOpacity(0.75),
              side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {
              makePayment(context);
            },
            child: Text(
              'Pay Advance ${widget.order.advance!.amount.toString()}\$',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
