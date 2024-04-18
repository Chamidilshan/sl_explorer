import 'package:flutter/material.dart';
import 'package:SL_Explorer/common/widgets/shimmer_effect_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SL_Explorer/features/home/Festivals/widgets/fetivals_card.dart';
import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:provider/provider.dart';
import 'package:SL_Explorer/services/api_services/festival_services.dart';
import 'package:SL_Explorer/models/festival_model.dart';
import 'package:SL_Explorer/providers/festivals.provider.dart';
import 'package:SL_Explorer/features/home/home_page.dart';

class FestivalListPage extends StatefulWidget {
  const FestivalListPage({super.key});

  @override
  State<FestivalListPage> createState() => _FestivalListPageState();
}

class _FestivalListPageState extends State<FestivalListPage> {

  List<Festival> festivals = [];
  FestivalApiServices apiService = FestivalApiServices();

  @override
  void initState(){
    super.initState();
    loadFestivalPackages();
  }

  loadFestivalPackages() async {
    try{
      final festivalProvider = Provider.of<FestivalProvider>(context, listen: false);
      List<Festival> fetchedFestivals = await apiService.fetchFestivals();
      festivalProvider.setFestivals(fetchedFestivals);
      setState(() {
        festivals = fetchedFestivals;
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Get.to(HomePage());
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Festive Shores of Sri Lanka',
                style: GoogleFonts.poppins(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                'Tap the arrow to view a short description.',
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
        body: festivals.isEmpty
            ? ShimmerWidget(
          height: 80.0,)
            : ListView.builder(
          itemCount: festivals.length,
          itemBuilder: (context, index) {
            return TripListCard(
              imgLink: festivals[index].festivalCoverImage,
              titleText:festivals[index].festivalName,
              festival: festivals,
              index: index,
            );
          },
        )
    );
  }
}
