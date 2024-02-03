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
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[200],
                        // child: Icon(
                        //   Icons.check,
                        //   size: 25,
                        //   color: Colors.white,
                        //   weight: 700,
                        // ),
                      
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
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[200],
                        // child: Icon(
                        //   Icons.check,
                        //   size: 25,
                        //   color: Colors.white,
                        //   weight: 700,
                        //
                        child: Text(
                          "3",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      Text("Confirmed")
                    ],
                  ),
                ],
              ),
            ),





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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Received",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "21-01-2024 19:20 pm\nSri Lanka Deluxe for 21-04-2024\n2 Adults",
                            ),
                          ),
                          Text(
                            "Order ID: 215dsdsdd45642165",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange[700]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),




            // Container(
            //   //height: 300,
            //   margin: EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(12.0),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.shade400,
            //         offset: Offset(1, 1), // Adjust the offset to control the shadow direction
            //         blurRadius: 30, // Adjust the blur radius for a softer or sharper shadow
            //       ),
            //     ],
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: Center(
            //       child: Text(
            //         "No Invoice yet"
            //       ),
            //     ),
            //   )
            // )




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
                                child: Image.asset(
                                  "assets/images/Villege_tour.jpg",
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: 100,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              SizedBox(
                                width: _width/2,
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
                                    Text("some order data",
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
                      ),

                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("dsdsdsnd dsdd"),
                                Text("\$ 129")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("dsdsdsnd dsdd"),
                                Text("\$ 129")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("dsdsdsnd dsdd"),
                                Text("\$ 129")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("dsdsdsnd dsdd"),
                                Text("\$ 129")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("dsdsdsnd dsdd"),
                                Text("\$ 129")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("dsdsdsnd dsdd"),
                                Text("\$ 129")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("dsdsdsnd dsdd"),
                                Text("\$ 129")
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
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