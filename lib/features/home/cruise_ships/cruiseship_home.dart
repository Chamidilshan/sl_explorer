import 'package:SL_Explorer/features/home/cruise_ships/DateBox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../constants/utils/styles.dart';

class CruiseShip extends StatefulWidget {
  const CruiseShip({super.key});

  @override
  State<CruiseShip> createState() => _CruiseShipState();
}


class _CruiseShipState extends State<CruiseShip> with TickerProviderStateMixin {


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
    DateTime time = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(time);


    return Scaffold(body:
      Column(
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
              'assets/images/roundTrip.png',
              'assets/images/roundTrip.png',
              'assets/images/roundTrip.png',
            ].map<Widget>((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 10.0, 10.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'CostaDeliziosa',
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
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 10.0, 10.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Our small island in the Indian Ocean has a lot to offer. Dream beaches, jungles, rolling hills and steep mountains, a diverse flora and fauna: the largest land dwellers (elephants) and the largest sea creatures (blue whales), millennia-old culture and modern lifestyle, 6 UNESCO World Heritage Sites and 2 UNESCO World Heritage Sites, the delicious Sri Lankan cuisine and above all its radiant and hospitable people',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Today : $formattedDate',
              style: GoogleFonts.aBeeZee(
                  color: const Color(0xFF232323),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0
              ), // Align text to the left
            ),
          ),
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
                        Tab(text: "Bentota"),
                        Tab(text: "Villege Tour"),
                        Tab(text: "Safari"),
                      ],
                    ),
                  ),
                  // TabBarView
                  Expanded(
                      child:
                      TabBarView(
                        controller: tabController,
                        children: [
                          // Tab 1 content
                          ListView(
                            shrinkWrap: true,
                            children: [
                              Image.asset('assets/images/Bentota.jpg'),  // Replace with your actual photo
                              SizedBox(height: 30),
                              Text(
                                'Bentota & West Coast',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Our small island in the Indian Ocean has a lot to offer. Dream beaches, jungles, rolling hills and steep mountains, a diverse flora and fauna: the largest land dwellers (elephants) and the largest sea creatures (blue whales), millennia-old culture and modern lifestyle, 6 UNESCO World Heritage Sites and 2 UNESCO World Heritage Sites, the delicious Sri Lankan cuisine and above all its radiant and hospitable people',
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
                              Image.asset('assets/images/Villege_tour.jpg'),  // Replace with your actual photo
                              SizedBox(height: 30),
                              Text(
                                'Wadduwa Villege Tour',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Our small island in the Indian Ocean has a lot to offer. Dream beaches, jungles, rolling hills and steep mountains, a diverse flora and fauna: the largest land dwellers (elephants) and the largest sea creatures (blue whales), millennia-old culture and modern lifestyle, 6 UNESCO World Heritage Sites and 2 UNESCO World Heritage Sites, the delicious Sri Lankan cuisine and above all its radiant and hospitable people',
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
                              Image.asset('assets/images/Safari.jpg'),  // Replace with your actual photo
                              SizedBox(height: 30),
                              Text(
                                'Safari',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Our small island in the Indian Ocean has a lot to offer. Dream beaches, jungles, rolling hills and steep mountains, a diverse flora and fauna: the largest land dwellers (elephants) and the largest sea creatures (blue whales), millennia-old culture and modern lifestyle, 6 UNESCO World Heritage Sites and 2 UNESCO World Heritage Sites, the delicious Sri Lankan cuisine and above all its radiant and hospitable people',
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
                      )
                  ),
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
                      fontSize: 14.0
                  ),
                ),Text(
                  '\$199',
                  style: GoogleFonts.montserrat(
                      color: const Color(0xFF2DD7A4),
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (){
                showModalBottomSheet(
                    context: context,
                    builder: (builder){
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: double.infinity,
                        color: Colors.transparent, //could change this to Color(0xFF737373),
                        //so you don't have to change MaterialApp canvasColor
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        _selectDate(context);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4.0),
                                              border: Border.all(color: Color(0xFF8C8C8C))

                                          ),
                                          height: 44.0,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 20.0),
                                                child: Text(
                                                    isDateSelected  ?
                                                    "${selectedDate.toLocal()}".split(' ')[0]
                                                        : "Select a date"
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 20.0),
                                                child: Icon(
                                                    Icons.calendar_month
                                                ),
                                              )
                                            ],
                                          )
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Center(
                                      child: Text(
                                        'Available Seats : 12',
                                        style: GoogleFonts.inter(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Select adults:',
                                                style: TextStyle(fontSize: 18.0),
                                              ),
                                              SizedBox(height: 8.0),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: Text(
                                                    'Select Item',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme.of(context).hintColor,
                                                    ),
                                                  ),
                                                  items: items
                                                      .map((String item) => DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
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
                                                  buttonStyleData: const ButtonStyleData(
                                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                                    height: 40,
                                                    width: 140,
                                                  ),
                                                  menuItemStyleData: const MenuItemStyleData(
                                                    height: 40,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Select Childs:',
                                                style: TextStyle(fontSize: 18.0),
                                              ),
                                              SizedBox(height: 8.0),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: Text(
                                                    'Select Item',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme.of(context).hintColor,
                                                    ),
                                                  ),
                                                  items: items
                                                      .map((String item) => DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
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
                                                  buttonStyleData:  ButtonStyleData(
                                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                                    height: 40,
                                                    width: 140,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(14),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ),
                                                  menuItemStyleData: const MenuItemStyleData(
                                                    height: 40,
                                                  ),
                                                  dropdownStyleData: DropdownStyleData(
                                                    maxHeight: 200,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(14),
                                                    ),
                                                    offset: const Offset(-20, 0),
                                                    scrollbarTheme: ScrollbarThemeData(
                                                      radius: const Radius.circular(40),
                                                      thickness: MaterialStateProperty.all(6),
                                                      thumbVisibility: MaterialStateProperty.all(true),
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
                            )
                        ),
                      );
                    }
                );
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