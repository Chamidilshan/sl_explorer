import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:SL_Explorer/features/authentication/screens/login_page.dart';
import 'package:SL_Explorer/features/home/round_trips/screens/round_trips_detsila_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundTripListPage extends StatefulWidget {
  const RoundTripListPage({super.key});

  @override
  State<RoundTripListPage> createState() => _RoundTripListPageState();
}

class _RoundTripListPageState extends State<RoundTripListPage> {
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
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: ExpansionTile(
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              trailing: IconButton(
                  icon: Icon(Icons.keyboard_double_arrow_right_rounded),
                onPressed: (){
                    Get.to(
                        RoundTripsDetailsPage()
                    );
                },
              ),
              collapsedIconColor: logoColor,
              title: SizedBox(
                height: 80.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                                'assets/images/roundTrip.png',
                              fit: BoxFit.cover,
                            ),
                          )
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Culuture & Nature',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0
                            ),
                          ),
                          Text(
                            '9 Days',
                            style: GoogleFonts.poppins(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w400,
                              fontSize: 14.0
                            ),
                          ),
                          Text(
                            '8 Nights',
                            style: GoogleFonts.poppins(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w400,
                              fontSize: 14.0
                            ),
                          )
                        ],
                      )
                    ]
                  ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 24.0, left: 24.0, bottom: 8.0),
                  child: Text(
                      "Experience the allure of our island with diverse activities. From the untamed beaches to serene yoga sessions, tea plantation hikes, thrilling kayak adventures, and ziplining through Ella's mountains with Flying Ravana. Our Sri Lanka Young & Fun tour offers constant excitement for both the young and the young at heart.",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF21231E),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                // const Text("isAdmin: No")
              ],
            ),
          ); 
        },
      )
    );
  }
}
