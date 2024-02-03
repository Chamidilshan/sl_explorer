import 'package:SL_Explorer/features/home/orders/ordersDetails.dart';
import 'package:SL_Explorer/features/home/profile.dart';
import 'package:SL_Explorer/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  //const OrderCard({super.key});
  final OrderRequest order;
  final int index;
  const OrderCard({
    super.key,
    required this.order,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        Get.to(() => OrderDetailsPage());
        //Get.to(() => OrderDetailsPage(orderId: orderId, orderDate: orderDate, numAdults: numAdults, packageName: packageName, packageDuration: packageDuration, packagePrice: packagePrice, packageImage: packageImage));
      },
      child: Card(
        margin: EdgeInsets.all(15),
        color: Colors.orange[50],
        child: Container(
          width: _width/1.5,
          height: 170.0,
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                        child: Image.asset(
                          "assets/images/Villege_tour.jpg",
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,
                        ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(
                      width: _width/1.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sri Lanka Deluxe",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.time_to_leave),
                              Text(" data 8-days | 7-nights")
                            ],
                          ),
                          Text("3-Adults | 2-Nights"),
                          Text("some order data               dsddsd",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text("Order ID: ${order.package}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
