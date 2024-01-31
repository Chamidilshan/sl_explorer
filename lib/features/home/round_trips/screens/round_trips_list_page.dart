import 'package:SL_Explorer/common/widgets/shimmer_effect_widget.dart';
import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:SL_Explorer/features/authentication/screens/login_page.dart';
import 'package:SL_Explorer/features/home/round_trips/screens/round_trips_detsila_page.dart';
import 'package:SL_Explorer/features/home/round_trips/widgets/trip_card.dart';
import 'package:SL_Explorer/models/round_trip_packages_model.dart';
import 'package:SL_Explorer/providers/round_trips_provider.dart';
import 'package:SL_Explorer/services/api_services/round_trips_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RoundTripListPage extends StatefulWidget {
  const RoundTripListPage({super.key});

  @override
  State<RoundTripListPage> createState() => _RoundTripListPageState();
}

class _RoundTripListPageState extends State<RoundTripListPage> {


  List<RoundTrip> roundTrips = [];
  RoundTripsApiService apiService = RoundTripsApiService();

  @override
  void initState(){
    super.initState();
    loadRoundTripPackages();
  }

  loadRoundTripPackages() async {
    try{
      final roundTripProvider = Provider.of<RoundTripProvider>(context, listen: false);
      List<RoundTrip> fetchedRoundTrips = await apiService.fetchRoundTrips();
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
      body: roundTrips.isEmpty
          ? ShimmerWidget(
        height: 80.0,)
          : ListView.builder(
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
      )
    );
  }
}


