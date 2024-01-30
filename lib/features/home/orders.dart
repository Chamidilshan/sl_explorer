import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'orders/ordersDetails.dart';

class OrdersPage extends StatelessWidget {

  //final String getUrl = ""

  final String orderId = '2351155454';
  final String orderDate = '21-04-2024';
  final int numAdults = 2;
  final int numChildren = 1;
  final String packageName = 'Sri Lanka Deluxe';
  final int packageDuration = 8;
  final int packagePrice = 375;
  final String packageImage = 'https://cdn.tourradar.com/s3/tour/1500x800/119449_5e3cdbba84872.jpg';

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Orders",
          style: GoogleFonts.merriweather(
          ),
        ),
        backgroundColor: const Color.fromRGBO(253, 129, 3, 1.0),
        foregroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
        shadowColor: const Color.fromRGBO(0, 0, 0, 1.0),
        surfaceTintColor: const Color.fromRGBO(0, 0, 0, 1.0),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 25.0,
          letterSpacing: 1.0,
        ),
        centerTitle: true,
      ),

      body: ListView(
        children: [
            Card(
              color: Colors.orangeAccent[800],
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                // Navigate to the order details page
                Get.to( () => OrderDetailsPage(
                      orderId: orderId,
                      orderDate: orderDate,
                      numAdults: numAdults,
                      packageName: packageName,
                      packageDuration: packageDuration,
                      packagePrice: packagePrice,
                      packageImage: packageImage,
                    ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        packageImage,
                        width: _width/3,
                        height: _width/3,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      width: _width/2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(packageName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text('Booked on: $orderDate'),
                          Text('For: $numAdults Adults'),
                          //Text('Duration: $packageDuration days'),
                          Text('Price: \$ $packagePrice'),
                          Text('Order ID: $orderId',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
