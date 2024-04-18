import 'package:flutter/material.dart';
import 'package:SL_Explorer/common/widgets/shimmer_effect_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SL_Explorer/features/home/SL_A_Z/widgets/image_card.dart';
import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:provider/provider.dart';
import 'package:SL_Explorer/services/api_services/a_z_api_service.dart';
import 'package:SL_Explorer/models/a_z_model.dart';
import 'package:SL_Explorer/providers/a_z_provider.dart';
import 'package:SL_Explorer/features/home/home_page.dart';
import 'package:shimmer/shimmer.dart';

class A_Z_page extends StatefulWidget {
  const A_Z_page({super.key});


  @override
  State<A_Z_page> createState() => _A_Z_pageState();
}

class _A_Z_pageState extends State<A_Z_page> {

  List<A_Z> a_zs = [];
  A_ZApiServices apiService = A_ZApiServices();

  @override
  void initState(){
    super.initState();
    loadA_Z();
  }
  loadA_Z() async {
    try{
      final a_zProvider = Provider.of<A_ZProvider>(context, listen: false);
      List<A_Z> fetchedA_Zs = await apiService.fetchA_Zs();
      a_zProvider.setA_Zs(fetchedA_Zs);
      setState(() {
        a_zs = fetchedA_Zs;
      });
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                  'Sri Lanka A-Z',
                  style: GoogleFonts.poppins(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  'Tap the image to  view a short description.',
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
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
              vertical: MediaQuery.of(context).size.height * 0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('The appeal of discovering foreign countries is to travel authentically, to get to know the people, nature, unknown culture and customs of the host country.',
                      style: GoogleFonts.montserrat(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
              
              
                  ),),
                  SizedBox(height: 20.0),
                  Text('Come as strangers and leave as friends',
                    style: GoogleFonts.montserrat(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: a_zs.isEmpty ? 5 : a_zs.length, // Show 5 shimmer items if data is not loaded yet
                    itemBuilder: (context, index) {
                      if (a_zs.isEmpty) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 100.0, // Adjust the height as needed
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ); // Placeholder for shimmer effect
                      } else {
                        return A_Z_Card(
                          imgLink: a_zs[index].topicCoverImage,
                          titleText: a_zs[index].mainTopic,
                          carddescription: a_zs[index].description.join('\n'),
                          a_zs: a_zs,
                          index: index,
                        );
                      }
                    },
                  ),
                  SizedBox(height: 60),
              
                ],
              ),
            ),
          ),


    ));
  }
}
