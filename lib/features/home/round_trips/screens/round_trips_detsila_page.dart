import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundTripsDetailsPage extends StatefulWidget {
  const RoundTripsDetailsPage({super.key});

  @override
  State<RoundTripsDetailsPage> createState() => _RoundTripsDetailsPageState();
}

class _RoundTripsDetailsPageState extends State<RoundTripsDetailsPage> {

  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  Map<String, String> dayDetails = { 
    'Day 1': "In the morning after your arrival at the airport you will be met by your German speaking SriLanka-Explorer tour guide. (Guests with an advance program in Negombo will be picked up at the hotel). We go to Pinnawela to the famous elephant orphanage. You'll have time to be close to the pachyderms, watching them feed and take a dip in the river, before checking into your hotel right on the Maha Oya River.",
    'Day 2': "Details for Day 2 In the morning after your arrival at the airport you will be met by your German speaking SriLanka-Explorer tour guide. (Guests with an advance program in Negombo will be picked up at the hotel). We go to Pinnawela to the famous elephant orphanage. You'll have time to be close to the pachyderms, watching them feed and take a dip in the river, before checking into your hotel right on the Maha Oya River.",
    'Day 3': "Details for Day 3 In the morning after your arrival at the airport you will be met by your German speaking SriLanka-Explorer tour guide. (Guests with an advance program in Negombo will be picked up at the hotel). We go to Pinnawela to the famous elephant orphanage. You'll have time to be close to the pachyderms, watching them feed and take a dip in the river, before checking into your hotel right on the Maha Oya River.",
    'Day 4': "Details for Day 4 In the morning after your arrival at the airport you will be met by your German speaking SriLanka-Explorer tour guide. (Guests with an advance program in Negombo will be picked up at the hotel). We go to Pinnawela to the famous elephant orphanage. You'll have time to be close to the pachyderms, watching them feed and take a dip in the river, before checking into your hotel right on the Maha Oya River.",
    'Day 5': "Details for Day 5 In the morning after your arrival at the airport you will be met by your German speaking SriLanka-Explorer tour guide. (Guests with an advance program in Negombo will be picked up at the hotel). We go to Pinnawela to the famous elephant orphanage. You'll have time to be close to the pachyderms, watching them feed and take a dip in the river, before checking into your hotel right on the Maha Oya River.",
    'Day 6': "Details for Day 6 In the morning after your arrival at the airport you will be met by your German speaking SriLanka-Explorer tour guide. (Guests with an advance program in Negombo will be picked up at the hotel). We go to Pinnawela to the famous elephant orphanage. You'll have time to be close to the pachyderms, watching them feed and take a dip in the river, before checking into your hotel right on the Maha Oya River.",
    'Day 7': "Details for Day 7 In the morning after your arrival at the airport you will be met by your German speaking SriLanka-Explorer tour guide. (Guests with an advance program in Negombo will be picked up at the hotel). We go to Pinnawela to the famous elephant orphanage. You'll have time to be close to the pachyderms, watching them feed and take a dip in the river, before checking into your hotel right on the Maha Oya River.",
  };

  String selectedDay = 'Day 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(16.0),
                //   child: Image.asset(
                //     'assets/images/roundTrip.png',
                //     fit: BoxFit.cover,
                //     width: double.infinity,
                //   ),
                // ),
                    CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeFactor: 0.25,
              aspectRatio: 2.0,
              disableCenter: true,
              viewportFraction: 1,
              enlargeCenterPage: false,
              autoPlayInterval: Duration(milliseconds: 2500),
              onPageChanged: (position,reason){
                print(reason);
                print(CarouselPageChangedReason.controller);
              },
              enableInfiniteScroll: false,
            ),
            items: images.map<Widget>((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/images/roundTrip.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
              );
            }).toList(),
                    ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Sri Lanka Deluxe',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  '9 Days | 5 Nights',
                  style: GoogleFonts.poppins(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Discover our beautiful island in many ways! The wild waves of the beaches, the spiritual tranquility during yoga or meditation. Experience the allure of our island with diverse activities.",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF21231E),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0
                  ),
                ),
                      SizedBox(
            height: 20.0,
                      ),
                      ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            collapsedIconColor: logoColor,
            title: SizedBox(
              child: Text(
                'Itinerary',
                style: GoogleFonts.poppins(
                  color: logoColor,
                  fontSize: 22.0
                ),
              ),
            ),
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (String day in dayDetails.keys)
                      RoundedButton(
                        text: day,
                        isSelected: selectedDay == day,
                        onPressed: () {
                          setState(() {
                            selectedDay = day;
                          });
                        },
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                dayDetails[selectedDay]!,
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 20.0),
              // const Text("isAdmin: No")
            ],
                      ), ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            collapsedIconColor: logoColor,
            title: SizedBox(
              child: Text(
                'Itinerary',
                style: GoogleFonts.poppins(
                  color: logoColor,
                  fontSize: 22.0
                ),
              ),
            ),
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (String day in dayDetails.keys)
                      RoundedButton(
                        text: day,
                        isSelected: selectedDay == day,
                        onPressed: () {
                          setState(() {
                            selectedDay = day;
                          });
                        },
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                dayDetails[selectedDay]!,
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 20.0),
              // const Text("isAdmin: No")
            ],
                      ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 80.0,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Starting From',
                  style: GoogleFonts.aBeeZee(
                      color: Color(0xFF232323),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0
                  ),
                ),Text(
                  '\$199',
                  style: GoogleFonts.montserrat(
                      color: Color(0xFF2DD7A4),
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: logoColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                minimumSize: Size(100, 56.0),
              ),
                child: Row(
                  children: [
                    Text(
                        'Pick A Date',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                    Icon(
                        Icons.arrow_right_outlined,
                      color: Colors.white,
                      size: 26.0,
                    )
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  RoundedButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: isSelected ? Colors.white.withOpacity(0.75): Color(0xFF9E9E9E).withOpacity(0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
            text,
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
