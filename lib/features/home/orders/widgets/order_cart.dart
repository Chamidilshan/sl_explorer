import 'package:SL_Explorer/features/home/orders/ordersDetails.dart';
// import 'package:SL_Explorer/features/home/profile.dart';
import 'package:SL_Explorer/models/orders_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  //const OrderCard({super.key});
  final Order order;
  final int index;
  const OrderCard({
    super.key,
    required this.order,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    //final _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        //Get.to(() => OrderDetailsPage());
        Get.to(() => OrderDetailsPage(order: order));
      },
      child: Container(
        //height: 300,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(1, 1), // Adjust the offset to control the shadow direction
              blurRadius: 30, // Adjust the blur radius for a softer or sharper shadow
            ),
          ],
          // border: Border.all(
          //   color: Colors.grey,
          //   width: 0.5,
          //   style: BorderStyle.solid
          // )
        ),
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
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        order.packageId.roundTrip!.packageCoverImage,
                        fit: BoxFit.cover,
                        color: Colors.white,
                        colorBlendMode: BlendMode.softLight,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(
                      width: _width/2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${order.packageId.roundTrip!.packageName}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                child: Icon(
                                    Icons.timelapse_outlined,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              Text("    ${order.packageId.roundTrip!.packageTitle} | ${order.packageId.roundTrip!.packageSubTitle}",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.people_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text("    ${order.noOfPeople.adults}-Adults | ${order.noOfPeople.children}-Children",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text("    ${order.tripDate.year}-${order.tripDate.month}-${order.tripDate.day}",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text("Order ID: ${order.orderId}",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
