import 'package:SL_Explorer/features/home/day_trip_screens/common_list.dart';
import 'package:SL_Explorer/features/home/round_trips/screens/round_trips_list_page.dart';
import 'package:SL_Explorer/services/firebase_services/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:get/get.dart';
import 'package:SL_Explorer/features/home/day_trip_screens/north_west_coast.dart';
import 'package:SL_Explorer/features/home/day_trip_screens/south_west_coast.dart';
import 'package:SL_Explorer/features/home/day_trip_screens/east_coast.dart';
import 'package:SL_Explorer/features/home/day_trip_screens/common_list.dart';
import 'package:badges/badges.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> cruise_shipdData = [
    {
      "imagePath": "assets/images/costa_ship.jpg",
      "cardText": "Costa Deliziosa"
    },
    {"imagePath": "assets/images/Mein_Schiff.png", "cardText": "Mein Schiff 5"},
    {
      "imagePath": "assets/images/Mein_Schiff6.png",
      "cardText": "Mein Schiff 6"
    },
    {"imagePath": "assets/images/AIDA_Stella.jpg", "cardText": "Aida Stella"},
  ];
  List<Map<String, String>> roundTripData = [
    {
      "imagePath": "assets/images/costa_ship.jpg",
      "cardText": "Sri Lanka Culture & Nature"
    },
    {
      "imagePath": "assets/images/Mein_Schiff.png",
      "cardText": "Sri Lanka Summer Trip"
    },
    {
      "imagePath": "assets/images/Mein_Schiff6.png",
      "cardText": "Sri Lanka Young & Fun"
    },
    {
      "imagePath": "assets/images/AIDA_Stella.jpg",
      "cardText": "Sri Lanka Reloaded"
    },
  ];
  List<Map<String, String>> dayTripData = [
    {
      "imagePath": "assets/images/costa_ship.jpg",
      "cardText": "Excursions South-West Coast"
    },
    {
      "imagePath": "assets/images/Mein_Schiff.png",
      "cardText": "Excursions north-west coast"
    },
    {
      "imagePath": "assets/images/Mein_Schiff6.png",
      "cardText": "East Coast Excursions"
    },
  ];
  List<Map<String, String>> maldives_emiratesData = [
    {
      "imagePath": "assets/images/costa_ship.jpg",
      "cardText": "Embudu, South Male Atoll"
    },
    {
      "imagePath": "assets/images/Mein_Schiff.png",
      "cardText": "Malahini Kuda Bandos"
    },
    {
      "imagePath": "assets/images/Mein_Schiff6.png",
      "cardText": "Adaaran Select Meedhupparu"
    },
  ];
  List<Map<String, String>> ayurveda_honeymoonData = [
    {"imagePath": "assets/images/costa_ship.jpg", "cardText": "Ayurveda"},
    {"imagePath": "assets/images/Mein_Schiff.png", "cardText": "Yoga Retreats"},
    {
      "imagePath": "assets/images/Mein_Schiff6.png",
      "cardText": "Get Married in Paradise"
    },
  ];

  int notificationCount = 0;
  void onNotificationClick() {
    setState(() {
      notificationCount = 0;
    });
    //
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _width * 1,
          height: _height * 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/beach.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _width * 0.05,
                  vertical: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.menu),
                    // ),

                    Row(
                      children: [
                        Container(
                          width: _width * 0.04,
                          height: _height * 0.025,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/location.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _width * 0.02,
                        ),
                        Text(
                          'Sri Lanka',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: _width * 0.035,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: _height * 0.003,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _width * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Explore',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: _width * 0.04,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: _height * 0.002,
                          ),
                        ),
                        IconButton(
                          onPressed: onNotificationClick,
                          icon: Icon(Icons.notifications_active),
                        ),
                      ],
                    ),

                    Text(
                      'Sri Lanka',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: _width * 0.08,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: _height * 0.001,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _width * 0.04,
                ),
                child: const searchbar(),
              ),
              SizedBox(
                height: _height * 0.01,
              ),
              Expanded(
                child: ListView(
                  children: [

                    _buildCardSection(
                      _width,
                      _height,
                      'Cruise Ship',
                      cruise_shipdData,
                      () {
                        //navigate to cruise ship page
                      },
                      context,
                    ),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    _buildCardSection(
                      _width,
                      _height,
                      'Round Trips',
                      roundTripData,
                      () {
                        Get.to(RoundTripListPage());
                      },
                      context,
                    ),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    _buildCardSection(
                      _width,
                      _height,
                      'Day Trips',
                      dayTripData,
                      () {
                        //Get.to(CommonListPage());
                      },
                      context,
                    ),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    _buildCardSection(
                      _width,
                      _height,
                      'Maldives & Emirates',
                      maldives_emiratesData,
                      () {
                        //Get.to(FormTest());
                      },
                      context,
                    ),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    _buildCardSection(
                      _width,
                      _height,
                      'Ayurveda & Honeymoon',
                      ayurveda_honeymoonData,
                      () {
                        // Navigate to ayurveda page
                      },
                      context,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCardSection(
  double _width,
  double _height,
  String sectionTitle,
  List<Map<String, String>> sectionData,
  VoidCallback onSeeAllTap,
  BuildContext context, {
  bool showSeeAll = false,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: _width * 0.04,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionTitle,
              style: const TextStyle(
                color: Color(0xFF232323),
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 2,
              ),
            ),
            if (sectionTitle != 'Cruise Ship')
              InkWell(
                onTap: onSeeAllTap,
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Color(0xFFfd8103),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          height: _height * 0.01,
        ),
        SizedBox(
          height: _height * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sectionData.length,
            itemBuilder: (context, index) {
              if (index < sectionData.length) {
                return Padding(
                  padding: EdgeInsets.only(right: _width * 0.02),
                  child: InkWell(
                    onTap: () {
                      _onCardTap(context, index, sectionData);
                    },
                    child: Cards(
                      imagePath: sectionData[index]["imagePath"]!,
                      cardText: sectionData[index]["cardText"]!,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    ),
  );
}

void _onCardTap(
    BuildContext context, int index, List<Map<String, String>> sectionData) {
  Map<String, String> tappedCardData = sectionData[index];

  if (tappedCardData['cardText'] == 'Costa Deliziosa') {
   //
  } else if (tappedCardData['cardText'] == 'Mein Schiff 5') {
 //
  } else if (tappedCardData['cardText'] == 'Excursions South-West Coast') {
    Get.to(South_West_CoastPage());
  }else if (tappedCardData['cardText'] == 'Excursions north-west coast') {
    Get.to(North_West_CoastPage());
  }else if (tappedCardData['cardText'] == 'East Coast Excursions') {
    Get.to(East_CoastPage());
  }
}

class searchbar extends StatefulWidget {
  const searchbar({Key? key}) : super(key: key);

  @override
  State<searchbar> createState() => _SearchBarState();
}

class _SearchBarState extends State<searchbar> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AnimSearchBar(
            width: 400,
            textController: textController,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
            helpText: 'Search', onSubmitted: (String) {},
            autoFocus: true,
            closeSearchOnSuffixTap: true,
            //animationDurationInMilli: 500,
          ),
        ],
      ),
    );
  }
}

class Cards extends StatefulWidget {
  final String imagePath;
  final String cardText;

  const Cards({Key? key, required this.imagePath, required this.cardText})
      : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Container(
      height: _height * 0.2,
      width: _width * 0.4,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.cardText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
