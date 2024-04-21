import 'package:SL_Explorer/features/home/cruise_ships/DateBox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:SL_Explorer/common/widgets/shimmer_effect_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:SL_Explorer/features/home/cruise_ships/cruise_ship_details_page.dart';
import 'package:SL_Explorer/features/home/cruise_ships/trip_card.dart';
import 'package:SL_Explorer/models/cruise_ship_packages_model.dart';
import 'package:SL_Explorer/providers/cruise_ships_provider.dart';
import 'package:SL_Explorer/services/api_services/cruise_ships_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/utils/styles.dart';

class CruiseShipListPage extends StatefulWidget {
  const CruiseShipListPage({super.key});

  @override
  State<CruiseShipListPage> createState() => _CruiseShipListPageState();
}

class _CruiseShipListPageState extends State<CruiseShipListPage> {


  List<CruiseShip> cruiseShips = [];
  CruiseShipsApiService apiService = CruiseShipsApiService();

  @override
  void initState(){
    super.initState();
    loadCruiseShipsPackages();
  }

  loadCruiseShipsPackages() async {
    try{
      final cruiseShipProvider = Provider.of<CruiseShipProvider>(context, listen: false);
      List<CruiseShip> fetchedCruiseShips = await apiService.fetchCruiseShips();
      cruiseShipProvider.setCruiseShips(fetchedCruiseShips);
      setState(() {
        cruiseShips = fetchedCruiseShips;
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
                'Cruise Ships',
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
        body: cruiseShips.isEmpty
            ? ShimmerWidget(
          height: 80.0,)
            : ListView.builder(
          itemCount: cruiseShips.length,
          itemBuilder: (context, index) {
            return TripListCard(
              imgLink: cruiseShips[index].packageCoverImage,
              titleText: cruiseShips[index].packageName,
              firstSubTitleText: cruiseShips[index].packageTitle,
              secondSubTitleText: cruiseShips[index].packageSubTitle,
              descriptionText: cruiseShips[index].packageShortDescription,
              cruiseShips: cruiseShips,
              index: index,
            );
          },
        )
    );
  }
}




