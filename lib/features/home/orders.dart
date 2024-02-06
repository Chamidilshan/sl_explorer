import 'package:SL_Explorer/common/widgets/Numbered_shimmer_effect.dart';
import 'package:SL_Explorer/features/home/orders/widgets/order_cart.dart';
import 'package:SL_Explorer/features/home/round_trips/widgets/trip_card.dart';
import 'package:SL_Explorer/models/orders_model.dart';
import 'package:SL_Explorer/providers/orders_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../common/widgets/shimmer_effect_widget.dart';
import '../../models/round_trip_packages_model.dart';
import '../../providers/orders_provider.dart';
import '../../providers/round_trips_provider.dart';
import '../../services/api_services/orders_api_service.dart';
import '../../services/api_services/round_trips_service.dart';
import 'orders/ordersDetails.dart';

class OrdersPage extends StatefulWidget {

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  //final String getUrl = ""
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late List<Order> orders;
  bool retrieved = false;
  OrderApiService apiService = OrderApiService();
  User? _user;

  @override
  void initState(){
    super.initState();
    _getCurrentUser();
    //print(_user!.uid);
    loadOrders();
    //load packages
    loadRoundTripPackages();
  }


  Future<void> _getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });
    }
  }

  loadOrders() async {
    try{
      final orderProvider = Provider.of<OrderProvider>(context, listen: false);
      List<Order> fetchedOrders = await apiService.fetchOrders(_user!.uid);
      orderProvider.setOrders(fetchedOrders);
      setState(() {
        orders = fetchedOrders;
        retrieved = true;
      });
    }catch(e){
      print(e.toString());
    }
  }



  List<RoundTrip> roundTrips = [];
  RoundTripsApiService packApiService = RoundTripsApiService();

  loadRoundTripPackages() async {
    try{
      final roundTripProvider = Provider.of<RoundTripProvider>(context, listen: false);
      List<RoundTrip> fetchedRoundTrips = await packApiService.fetchRoundTrips();
      roundTripProvider.setRoundTrips(fetchedRoundTrips);
      setState(() {
        roundTrips = fetchedRoundTrips;
      });
    }catch(e){
      print(e.toString());
    }
  }





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
          fontSize: 20.0,
          letterSpacing: 1.0,
        ),
        centerTitle: true,
      ),

      body: ListView(
        children: [



          retrieved == false
          ? SizedBox(
            height: 200 * 1,//count
            child: NumberedShimmerWidgets(
            height: 180.0, count: 1,),
          )
          :
          orders.isEmpty
          ?Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(child: Text("No Orders Yet")),
          )
          :SizedBox(
            height: orders.length * 200,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),//to top scrolling
                itemCount: orders.length,
                itemBuilder: (context, index){
                  return OrderCard(
                    order: orders[index],
                    index: index,
                  );
                }
            ),
          ),




          Container(
            //height: double.infinity,
            margin: EdgeInsets.fromLTRB(10, 50, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10
                      ),
                      child: Text(
                        "More to Explore",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.deepOrangeAccent,
                      size: 30,
                    )
                  ],
                ),



                roundTrips.isEmpty
                    ? SizedBox(
                      height: 80 * 5,
                      child: ShimmerWidget(height: 100.0,),
                    )
                    : SizedBox(
                      height: roundTrips.length * 200,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: roundTrips.length,
                        itemBuilder: (context, index) {
                      return TripListCard(
                        imgLink: roundTrips[index].packageCoverImage,
                        titleText: roundTrips[index].packageName,
                        firstSubTitleText: roundTrips[index].packageTitle,
                        secondSubTitleText: roundTrips[index].packageSubTitle,
                        descriptionText: roundTrips[index].packageShortDescription,
                        roundTrips: roundTrips,
                        index: index,
                      );
                                        },
                                      ),
                    )
              ],
            ),
          )
        ],
      )
    );
  }
}
