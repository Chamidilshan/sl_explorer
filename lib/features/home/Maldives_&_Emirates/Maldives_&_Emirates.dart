import 'package:SL_Explorer/features/home/cruise_ships/DateBox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/utils/styles.dart';

class maldives_emirates extends StatefulWidget {
  const maldives_emirates({super.key});

  @override
  State<maldives_emirates> createState() => _CruiseShipState();
}

class _CruiseShipState extends State<maldives_emirates>
    with TickerProviderStateMixin {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String selectedLocation = 'Ella';
  String? selectedValue;

  String selectedDay = 'Day 1';

  DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        isDateSelected = true;
      });
    }
  }

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeFactor: 0.25,
              aspectRatio: 2.0,
              disableCenter: true,
              viewportFraction: 1,
              enlargeCenterPage: false,
              autoPlayInterval: const Duration(milliseconds: 2500),
              onPageChanged: (position, reason) {
                print(reason);
                print(CarouselPageChangedReason.controller);
              },
              enableInfiniteScroll: false,
            ),
            items: [
              'assets/images/maldives 1.jpg',
              'assets/images/maldives 2.jpg',
              'assets/images/maldives 3.jpg',
            ].map<Widget>((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        i,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          //IMAGE NEXT/BACK BUTTONS

          //TOPIC
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Sri Lanka & Maldives',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          //Description
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Two or three in one go for your perfect extra holiday! Combine your Sri Lanka tour with everything our enchanting island has to offer in terms of nature, culture and experiences with days on a beautiful Maldives island to laze, dive, snorkel, swim and relax.Desert meets tropics is the motto on our Sri Lanka & Emirates combination trips. Stop in Dubai, Abu Dhabi, Doha or Muscat on your return flight and enjoy the fairy tales from 1001 Nights of the Orient and the exotic diversity and warm-heartedness of Sri Lanka.',
                textAlign: TextAlign.left,
                style: GoogleFonts.abel(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          //DATE

          //SELECT MENU BAR

          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  // TabBar
                  Container(
                    child: TabBar(
                      controller: tabController,
                      tabs: [
                        Tab(text: "South Male Atoll"),
                        Tab(text: "Malhini Kuda Bandos"),
                        Tab(text: "Meedhupparu"),
                      ],
                    ),
                  ),
                  // TabBarView
                  Expanded(
                      child: TabBarView(
                    controller: tabController,
                    children: [
                      // Tab 1 content
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Image.asset(
                              'assets/images/maldives 4.jpg'), // Replace with your actual photo
                          SizedBox(height: 30),
                          Text(
                            'Embudu***,South Male Atoll',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Embudu is a small Maldives island in the South Male Atoll and impresses with romantic beach bays. The house reef can be seen from the beach and is ideal for snorkeling. All around you will find more than 30 top diving spots, such as Manta Point and the extremely steep reef "The Wall". Transfer from Male about 45 minutes by speedboat.',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.abel(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),

                      // Tab 2 content
                      ListView(
                        children: [
                          Image.asset(
                              'assets/images/maldives 5.jpg'), // Replace with your actual photo
                          SizedBox(height: 30),
                          Text(
                            'Malhini Kuda Bandos****',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Powder-white dream beaches, turquoise blue water and a wide range of water sports on offer on the almost circular Malahini Kuda Bandos Island for that real Maldives feeling.In addition to surfing, snorkeling and playing volleyball, you can also relax with a massage in the spa so that you are fit for a disco, DJ, beach party or movie night on the beach in the evening.',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.abel(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),

                      // Tab 3 content
                      ListView(
                        children: [
                          Image.asset(
                              'assets/images/maldives 6.jpg'), // Replace with your actual photo
                          SizedBox(height: 30),
                          Text(
                            'Adaaran Select Meedhupparu***',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'The island with the gently sloping, beautiful sandy beach and turquoise blue lagoon is located in the southern part of the Raa Atoll, a great, largely untouched diving and snorkeling area. The house reef is between 80 m and 250 m away. The seaplane transfer from Male Airport takes approximately 45 minutes.',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.abel(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                ],
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        color: Colors.transparent,
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
                      color: const Color(0xFF232323),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0),
                ),
                Text(
                  '\$199',
                  style: GoogleFonts.montserrat(
                      color: const Color(0xFF2DD7A4),
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: double.infinity,
                        color: Colors
                            .transparent, //could change this to Color(0xFF737373),
                        //so you don't have to change MaterialApp canvasColor
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 20.0),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              border: Border.all(
                                                  color: Color(0xFF8C8C8C))),
                                          height: 44.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Text(isDateSelected
                                                    ? "${selectedDate.toLocal()}"
                                                        .split(' ')[0]
                                                    : "Select a date"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20.0),
                                                child:
                                                    Icon(Icons.calendar_month),
                                              )
                                            ],
                                          )),
                                    ),
                                    SizedBox(height: 20.0),
                                    Center(
                                      child: Text(
                                        'Available Seats : 12',
                                        style: GoogleFonts.inter(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Select adults:',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              SizedBox(height: 8.0),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: Text(
                                                    'Select Item',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  items: items
                                                      .map((String item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: selectedValue,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedValue = value;
                                                    });
                                                  },
                                                  buttonStyleData:
                                                      const ButtonStyleData(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16),
                                                    height: 40,
                                                    width: 140,
                                                  ),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    height: 40,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Select Childs:',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              SizedBox(height: 8.0),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: Text(
                                                    'Select Item',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  items: items
                                                      .map((String item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: selectedValue,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedValue = value;
                                                    });
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16),
                                                    height: 40,
                                                    width: 140,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    height: 40,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    maxHeight: 200,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                    ),
                                                    offset:
                                                        const Offset(-20, 0),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      radius:
                                                          const Radius.circular(
                                                              40),
                                                      thickness:
                                                          MaterialStateProperty
                                                              .all(6),
                                                      thumbVisibility:
                                                          MaterialStateProperty
                                                              .all(true),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.0),
                                    _buildPriceListItem('Single Room'),
                                    SizedBox(height: 8.0),
                                    _buildPriceListItem('Double Room'),
                                    SizedBox(height: 8.0),
                                    _buildPriceListItem('Triple Room'),
                                  ],
                                ),
                              ),
                            )),
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: logoColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                minimumSize: const Size(100, 56.0),
              ),
              child: const Row(
                children: [
                  Text(
                    'Book Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic),
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

Widget _buildPriceListItem(String itemName) {
  int itemCount = 0;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            itemName,
            style: TextStyle(fontSize: 18.0),
          ),
          Spacer(),
          Text(
            '\$50.00', // Replace with actual price
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
      SizedBox(height: 8.0),
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              if (itemCount > 0) {
                itemCount--;
              }
            },
          ),
          Text(
            itemCount.toString(),
            style: TextStyle(fontSize: 18.0),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Implement logic to handle the increase in count
              itemCount++;
            },
          ),
        ],
      ),
      Divider(),
    ],
  );
}
