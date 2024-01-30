
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsPage extends StatelessWidget {
  final String orderId;
  final String orderDate;
  final int numAdults;
  final String packageName;
  final int packageDuration;
  final int packagePrice;
  final String packageImage;

  OrderDetailsPage({
    required this.orderId,
    required this.orderDate,
    required this.numAdults,
    required this.packageName,
    required this.packageDuration,
    required this.packagePrice,
    required this.packageImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Order Details",
            style: GoogleFonts.merriweather(
            ),
          ),
          backgroundColor: const Color.fromRGBO(253, 129, 3, 1.0),
          foregroundColor: Colors.white,
          shadowColor: const Color.fromRGBO(0, 0, 0, 1.0),
          surfaceTintColor: const Color.fromRGBO(0, 0, 0, 1.0),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 25.0,
            letterSpacing: 1.0,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.fromLTRB(5,20,5,0),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(packageImage, width: double.infinity, height: 200
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order ID: $orderId',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Booked on $orderDate',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'For $numAdults Adults',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '$packageName - $packageDuration days',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '\$$packagePrice x $packageDuration',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                    )
                  ])
          ),
        ));}}