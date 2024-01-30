import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                // Navigate to the order details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsPage(
                      orderId: orderId,
                      orderDate: orderDate,
                      numAdults: numAdults,
                      packageName: packageName,
                      packageDuration: packageDuration,
                      packagePrice: packagePrice,
                      packageImage: packageImage,
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: Image.network(packageImage, width: 80),
                title: Text(packageName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Booked on $orderDate'),
                    Text('For $numAdults Adults'),
                    Text('Duration: $packageDuration days'),
                    Text('\$$packagePrice x $packageDuration'),
                  ],
                ),
                trailing: Text('Order ID: $orderId'),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
        title: Text('Order Details'),
    ),
    body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Image.network(packageImage, width: double.infinity, height: 200),
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
    ));}}