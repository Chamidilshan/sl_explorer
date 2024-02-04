import 'package:SL_Explorer/features/home/orders/widgets/remainingDays.dart';
import 'package:SL_Explorer/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class OrderDetailsPage extends StatelessWidget {
  // final String orderId;
  // final String orderDate;
  // final int numAdults;
  // final String packageName;
  // final int packageDuration;
  // final int packagePrice;
  // final String packageImage;
  //
  // OrderDetailsPage({
  //   required this.orderId,
  //   required this.orderDate,
  //   required this.numAdults,
  //   required this.packageName,
  //   required this.packageDuration,
  //   required this.packagePrice,
  //   required this.packageImage,
  // });

  final Order order;

  OrderDetailsPage({
    required this.order
});

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.orangeAccent[400],
                        child: Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.white,
                          weight: 700,
                        ),
                      ),
                      Text(
                        "Pending"
                      )
                    ],
                  ),
                  Text(
                      "-----",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                      color: Colors.orangeAccent[200],
                    ),
                  ),
                  Column(
                    children: [
                      order.status == "Invoice" || order.status == "Confirmed"
                      ?
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.orangeAccent[400],
                        child: Icon(
                          Icons.check,
                          size: 25,
                          color: Colors.white,
                          weight: 700,
                        ),
                      )
                      :
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[200],
                        child: Text(
                          "2",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.orange,
                          ),
                        ),
                      ),

                      Text("  Invoice  ")
                    ],
                  ),
                  Text(
                      "-----",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                      color: Colors.orangeAccent[200],
                    ),
                  ),
                  Column(
                    children: [
                      order.status != "Confirmed"
                      ?
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[200],
                        child: Text(
                          "3",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.orange,
                          ),
                        ),
                      )
                      :
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.orangeAccent[400],
                        child: Icon(
                          Icons.check,
                          size: 25,
                          color: Colors.white,
                          weight: 700,
                        )
                      ),
                      Text("Confirmed")
                    ],
                  ),
                ],
              ),
            ),




            order.status == "Confirmed"
            ?
            Container(
              //height: 300,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(1, 1), // Adjust the offset to control the shadow direction
                      blurRadius: 30, // Adjust the blur radius for a softer or sharper shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.orangeAccent[400],
                            child: Icon(
                              Icons.check,
                              size: 15,
                              color: Colors.white,
                              weight: 700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Order Confirmed",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "   (on ${order.orderDate.year}-${order.orderDate.month}-${order.orderDate.day})",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                      ),
                                    )
                                  ],
                                ),



                              ],
                            ),
                          ),
                        ],
                      ),


                      Builder(
                          builder: (context){
                            return RemainingDaysWidget(
                                startDate: order.orderDate,
                                endDate: order.tripDate,
                            );
                          }
                      )

                    ],
                  ),
                )
            )
            :
            Text(""),






            Container(
              //height: 300,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: Offset(1, 1), // Adjust the offset to control the shadow direction
                    blurRadius: 30, // Adjust the blur radius for a softer or sharper shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.orangeAccent[400],
                      child: Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.white,
                        weight: 700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Order Received",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                  "   (on ${order.orderDate.year}-${order.orderDate.month}-${order.orderDate.day})",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                                  "Pack:"
                                  "  ${order.packageId.roundTrip!.packageName}\n"
                                  "Trip:"
                                  "  ${order.tripDate}\n"
                                  "People: ${order.noOfPeople.adults}-Adults and ${order.noOfPeople.children}-Children",
                              style: GoogleFonts.poppins(

                              ),
                            ),
                          ),
                          Text(
                            "${order.orderId}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepOrange[700]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),





            order.status == "Invoice" || order.status == "Confirmed"
            ?
            Container(
              //height: 300,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(1, 1), // Adjust the offset to control the shadow direction
                      blurRadius: 30, // Adjust the blur radius for a softer or sharper shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.orangeAccent[400],
                            child: Icon(
                              Icons.check,
                              size: 15,
                              color: Colors.white,
                              weight: 700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25
                            ),
                            child: Text(
                              "Invoice Received",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20
                        ),
                        child: SizedBox(
                          //height: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                child: Image.network(
                                  order.packageId.roundTrip!.packageCoverImage,
                                  fit: BoxFit.cover,
                                  colorBlendMode: BlendMode.softLight,
                                  height: 100,
                                  width: 100,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              SizedBox(
                                width: _width/2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.packageId.roundTrip!.packageName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                            Icons.people,
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
                                        Icon(Icons.date_range,
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
                      ),

                      Padding(
                        padding: EdgeInsets.all(15),
                        child: SizedBox(
                          height: order.options!.length * 20,
                          child: ListView.separated(
                            itemCount: order.options!.length,
                            separatorBuilder: (BuildContext context, int index) => Divider(),
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${order.options![index].name}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text("${order.options![index].amount}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              );
                            }
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                              "Pay your advance and upload the payment reference number here."
                                  "Don’t forget to put your order number as a reference in the payment.",
                              style: GoogleFonts.poppins(
                                color: Colors.grey[700],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20
                              ),
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                //color: Colors.orange,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                  style: BorderStyle.solid
                                )
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Reference Number",
                                  border: InputBorder.none,
                                ),

                              ),
                            ),
                            ElevatedButton(
                                onPressed: (){},
                                child: Text(
                                  "Submit",
                                )
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                )
            )
            :
            Container(
              //height: 300,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(1, 1),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                        "No Invoice yet"
                    ),
                  ),
                )
            ),



          ],
        )












        // Container(
        //   padding: const EdgeInsets.all(8.0),
        //   margin: const EdgeInsets.fromLTRB(5,20,5,0),
        //   child: SingleChildScrollView(
        //       child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             ClipRRect(
        //               borderRadius: BorderRadius.circular(20),
        //               child: Image.network(
        //                   //packageImage,
        //                 "",
        //                   width: double.infinity,
        //                   height: 200
        //               ),
        //             ),
        //             Padding(
        //                 padding: EdgeInsets.all(10),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       'Order ID: orderId',
        //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //                     ),
        //                     Text(
        //                       'Booked on orderDate',
        //                       style: TextStyle(fontSize: 16),
        //                     ),
        //                     Text(
        //                       'For numAdults Adults',
        //                       style: TextStyle(fontSize: 16),
        //                     ),
        //                     Text(
        //                       'packageName - packageDuration days',
        //                       style: TextStyle(fontSize: 16),
        //                     ),
        //                     Text(
        //                       '\$packagePrice x packageDuration',
        //                       style: TextStyle(fontSize: 16),
        //                     ),
        //                   ],
        //                 )
        //             )
        //           ])
        //   ),
        // )



    );
  }
}