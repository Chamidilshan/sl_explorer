import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:SL_Explorer/features/authentication/screens/login_page.dart';
import 'package:SL_Explorer/features/home/round_trips/screens/round_trips_detsila_page.dart';
import 'package:SL_Explorer/features/home/round_trips/widgets/trip_card.dart';
import 'package:SL_Explorer/models/round_trip_packages_model.dart';
import 'package:SL_Explorer/services/api_services/round_trips_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundTripListPage extends StatefulWidget {
  const RoundTripListPage({super.key});

  @override
  State<RoundTripListPage> createState() => _RoundTripListPageState();
}

class _RoundTripListPageState extends State<RoundTripListPage> {

  // List<Map<String, String>> tripData = [
  //   {
  //     "imgLink": "assets/images/roundTrip.png",
  //     "titleText": "Trip 1",
  //     "firstSubTitleText": "Location 1",
  //     "secondSubTitleText": "Duration: 3 days",
  //     "descriptionText": "Explore the beautiful landscapes of Location 1 on this exciting trip."
  //   },
  //   {
  //     "imgLink": "assets/images/roundTrip.png",
  //     "titleText": "Trip 2",
  //     "firstSubTitleText": "Location 2",
  //     "secondSubTitleText": "Duration: 4 days",
  //     "descriptionText": "Discover the rich culture and history of Location 2 with our guided tour."
  //   },
  //   {
  //     "imgLink": "assets/images/roundTrip.png",
  //     "titleText": "Trip 3",
  //     "firstSubTitleText": "Location 3",
  //     "secondSubTitleText": "Duration: 5 days",
  //     "descriptionText": "Experience the adventure of a lifetime in Location 3's stunning natural wonders."
  //   },
  //   {
  //     "imgLink": "assets/images/roundTrip.png",
  //     "titleText": "Trip 4",
  //     "firstSubTitleText": "Location 4",
  //     "secondSubTitleText": "Duration: 2 days",
  //     "descriptionText": "Relax and unwind in the serene surroundings of Location 4's luxury resorts."
  //   },
  //   {
  //     "imgLink": "assets/images/roundTrip.png",
  //     "titleText": "Trip 5",
  //     "firstSubTitleText": "Location 5",
  //     "secondSubTitleText": "Duration: 6 days",
  //     "descriptionText": "Embark on a culinary journey through the flavors of Location 5's vibrant food scene."
  //   },
  //   {
  //     "imgLink": "assets/images/roundTrip.png",
  //     "titleText": "Trip 6",
  //     "firstSubTitleText": "Location 6",
  //     "secondSubTitleText": "Duration: 4 days",
  //     "descriptionText": "Immerse yourself in the arts and culture of Location 6's bustling city streets."
  //   },
  //   {
  //     "imgLink": "assets/images/roundTrip.png",
  //     "titleText": "Trip 7",
  //     "firstSubTitleText": "Location 7",
  //     "secondSubTitleText": "Duration: 5 days",
  //     "descriptionText": "Experience the thrill of adventure sports in the scenic landscapes of Location 7."
  //   },
  //   {
  //     "imgLink": "assets/images/roundTrip.png",
  //     "titleText": "Trip 8",
  //     "firstSubTitleText": "Location 8",
  //     "secondSubTitleText": "Duration: 3 days",
  //     "descriptionText": "Uncover the hidden gems of Location 8's off-the-beaten-path attractions."
  //   },
  // ];
  List<RoundTrip> roundTrips = [];
  RoundTripsApiService apiService = RoundTripsApiService();

  @override
  void initState(){
    super.initState();
    loadRoundTripPackages();
  }

  loadRoundTripPackages() async {
    try{
      List<RoundTrip> fetchedRoundTrips = await apiService.fetchRoundTrips();
      setState(() {
        roundTrips = fetchedRoundTrips;
      });
    }catch(e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Round Trips',
              style: GoogleFonts.poppins(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(
              'Tap the cards to view a short description about the tour.',
              style: GoogleFonts.montserrat(
                fontSize: 12.0,
                color: Colors.black,
                fontWeight: FontWeight.w300
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: roundTrips.length,
        itemBuilder: (context, index) {
          return TripListCard(
            imgLink: roundTrips[index].packageCoverImage,
            titleText: roundTrips[index].packageName,
            firstSubTitleText: roundTrips[index].packageTitle,
            secondSubTitleText: roundTrips[index].packageSubTitle,
            descriptionText: roundTrips[index].packageSubTitle
          );
        },
      )
    );
  }
}


