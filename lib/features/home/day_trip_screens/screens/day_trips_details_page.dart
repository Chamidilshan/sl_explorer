import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:SL_Explorer/models/orders_model.dart';
import 'package:SL_Explorer/services/api_services/orders_api_service.dart';
import 'package:SL_Explorer/models/day_trip_packages_model.dart';
import 'package:SL_Explorer/services/firebase_services/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DayTripDetailsPage extends StatefulWidget {
  final DayTrip dayTrip;

  const DayTripDetailsPage({super.key, required this.dayTrip});

  @override
  State<DayTripDetailsPage> createState() => _DayTripDetailsPageState();
}

class _DayTripDetailsPageState extends State<DayTripDetailsPage> {
  String? selectedAdultCount;

  String? selectedChildCount;

  final List<String> childCount = ['1', '2', '3', '4', '5', '6'];

  final List<String> adultCount = [
    '1',
    '2',
    '3',
    '4',
  ];

  OrderApiService apiService = OrderApiService();
  @override
  int selectedDay = 1;


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

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 200.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeFactor: 0.25,
                    aspectRatio: 2.0,
                    disableCenter: true,
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                    autoPlayInterval: const Duration(milliseconds: 1500),
                    onPageChanged: (position, reason) {
                      print(reason);
                      print(CarouselPageChangedReason.controller);
                    },
                    enableInfiniteScroll: false,
                  ),
                  items: widget.dayTrip.packageImageLinks.map<Widget>((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.network(
                              item,
                              // Assuming each item has only one image link
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.dayTrip.packageName,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          widget.dayTrip.packageSubTitle,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF666666),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          widget.dayTrip.packageShortDescription,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF21231E),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        // Add more content as needed
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: ExpansionTile(
                      collapsedIconColor: logoColor,
                      title: SizedBox(
                        child: Text(
                          'Available Dates',
                          style: GoogleFonts.poppins(
                            color: logoColor,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                      children: [
                        Text('Avaliable dates are represented in Green', style: GoogleFonts.poppins(
                      fontSize: 12.0,
                    ),),
                        SizedBox(height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02),

                        for (var location in widget.dayTrip.locations)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'From: ${location.name}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.01),
                                      Text(
                                        'Price per person: \u20AC ${location.prices} ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: _height * 0.02,
                                    horizontal: _width * 0.04,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      for (var date in location.avaliableDates)
                                        _buildDayBox(date.dayName, date.avaliability),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.01),
                  SingleChildScrollView(
                    child: ExpansionTile(
                      collapsedIconColor: logoColor,
                      title: SizedBox(
                        child: Text(
                          'Services',
                          style: GoogleFonts.poppins(
                            color: logoColor,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(alignment: Alignment.topLeft),
                              _buildServiceCategory(
                                  'Included', widget.dayTrip.services
                                  .where((service) =>
                              service.category == 'included')
                                  .toList()),
                              _buildServiceCategory(
                                  'Not included', widget.dayTrip.services
                                  .where((service) =>
                              service.category == 'not included')
                                  .toList()),
                              _buildServiceCategory(
                                  'Recommendations', widget.dayTrip.services
                                  .where((service) =>
                              service.category == 'recommendations')
                                  .toList()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.2),
                  // ExpansionTile(
                  //   collapsedIconColor: logoColor,
                  //   title: SizedBox(
                  //     child: Text(
                  //       'Hotel',
                  //       style: GoogleFonts.poppins(
                  //         color: logoColor,
                  //         fontSize: 22.0,
                  //       ),
                  //     ),
                  //   ),
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           widget.dayTrip.hotels[0].hotel.hotelName,
                  //           style: TextStyle(
                  //             fontSize: 18.0,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //         SizedBox(height: 8.0),
                  //         Image.network(
                  //           widget.dayTrip.hotels[0].hotel.hotelImage,
                  //           height: 200.0,
                  //           width: 200.0,
                  //           fit: BoxFit.cover,
                  //         ),
                  //         SizedBox(height: 8.0),
                  //         Text(
                  //           widget.dayTrip.hotels[0].hotelLocationDesc,
                  //           style: TextStyle(
                  //             fontSize: 14.0,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
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
                Row(
                  children: [
                    Text(
                      'per person',
                      style: GoogleFonts.aBeeZee(
                          color: const Color(0xFF232323),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '\u20AC${widget.dayTrip.price}',
                      style: GoogleFonts.montserrat(
                          color: const Color(0xFF2DD7A4),
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.5,
                        width: double.infinity,
                        color: Colors.transparent,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Select your perfered date',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _selectDate(context);
                                        setState() {}
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
                                                    ? "${selectedDate
                                                    .toLocal()}"
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
                                                'Select Adults:',
                                                style:
                                                TextStyle(fontSize: 16.0),
                                              ),
                                              SizedBox(height: 8.0),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: Text(
                                                    '',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme
                                                          .of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  items: adultCount
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
                                                  value: selectedAdultCount,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedAdultCount =
                                                          value;
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
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Select Children:',
                                                style:
                                                TextStyle(fontSize: 16.0),
                                              ),
                                              SizedBox(height: 8.0),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: Text(
                                                    '',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme
                                                          .of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  items: childCount
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
                                                  value: selectedChildCount,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedChildCount =
                                                          value;
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
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 16),
                                        const Text(
                                          'from/to location & hotel:',
                                        ),
                                      ],
                                    ),
                                    const TextField(
                                      decoration: InputDecoration(
                                        hintText: 'e.g. Heritance Ahungalla',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    const Text(
                                      'Questions/messages/requests:',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    const TextField(
                                      maxLines:
                                      5, // Set the maximum number of lines
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Type here...',
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Add to Cart',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async{
                                        String orderDate =
                                        DateTime.now().toString();
                                        String tripDate =
                                        selectedDate.toString();
                                        Map<String, String> packageId = {
                                          'dayTrip':
                                          widget.dayTrip.id.toString()
                                        };
                                        Map<String, int> noOfPeople = {
                                          'adults': int.parse(
                                              selectedAdultCount.toString()),
                                          'children': int.parse(
                                              selectedChildCount.toString())
                                        };
                                        var selectedSingleRooms;
                                        var selectedDoubleRooms;
                                        var selectedTripleRooms;
                                        Map<String, int> rooms = {
                                          'single': selectedSingleRooms,
                                          'double': selectedDoubleRooms,
                                          'triple': selectedTripleRooms,
                                          'Quadruple': 0
                                        };
                                        String status = "Pending";
                                        Map<String, double> price = {
                                          'shownPrice per person': widget.dayTrip.price != null ? widget.dayTrip.price!.toDouble() : 0.0,
                                        };
                                        Map<String, dynamic> advance = {
                                          'isPaid': false
                                        };
                                        Map<String, dynamic> option = {
                                          "name": "Beach Hotel",
                                          "amount": 110
                                        };

                                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                                        String? token = prefs.getString('fcmToken');
                                        print('token is $token');

                                        final order = OrderRequest(
                                            customerId: AuthenticationRepository
                                                .instance.userId
                                                .toString(),
                                            packageId: packageId,
                                            orderDate: orderDate,
                                            tripDate: tripDate,
                                            noOfPeople: noOfPeople,
                                            rooms: rooms,
                                            status: status,
                                            price: price, 
                                            advance: advance,
                                            option: option,
                                            userDeviceToken: token.toString()
                                        );

                                        apiService.placeOrder(order, context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: logoColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(12.0)),
                                        minimumSize: const Size(100, 56.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Book Now',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    )
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
                    'Pick A Date',
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

  Widget _buildServiceCategory(String title, List<Service> services) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: services.map((service) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '• ${service.name}',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'AbhayaLibreMedium',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3A544F),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDayBox(String day, bool isAvailable) {
    Color boxColor = isAvailable ? Colors.green : Colors.red;

    return Flexible(
      flex: 2,
      child: Container(
        width: 65,
        height: 40,
        color: boxColor,
        child: Center(
          child: Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final String dateName;
  final bool isSelected;
  final VoidCallback onPressed;

  RoundedButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
    required this.dateName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Colors.white.withOpacity(0.75)
              : const Color(0xFF9E9E9E).withOpacity(0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          'Day $text',
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

// class DatesExpansionTile extends StatelessWidget {
//   final List<Location> locations;
//
//   const DatesExpansionTile({Key? key, required this.locations})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final _width = MediaQuery.of(context).size.width;
//     final _height = MediaQuery.of(context).size.height;
//     return SingleChildScrollView(
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: ExpansionTile(
//           collapsedIconColor: logoColor,
//           title: SizedBox(
//             child: Text(
//               'Available Dates',
//               style: GoogleFonts.poppins(
//                 color: logoColor,
//                 fontSize: 22.0,
//               ),
//             ),
//           ),
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Text(
//                 'Available Dates are in Green',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: MediaQuery.of(context).size.width * 0.025,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w400,
//                   height: MediaQuery.of(context).size.height * 0.001,
//                 ),
//               ),
//             ),
//             for (var location in locations)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     location.name,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18.0,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Container(
//                     color: Colors.white,
//                     padding: EdgeInsets.symmetric(
//                         vertical: _height * 0.02, horizontal: _width * 0.04),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         for (var date in location.availableDates)
//                           _buildDayBox(date.dayName, date.availability),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDayBox(String day, bool isAvailable) {
//     Color boxColor = isAvailable ? Colors.green : Colors.red;
//
//     return Flexible(
//       flex: 2,
//       child: Container(
//         width: 65,
//         height: 40,
//         color: boxColor,
//         child: Center(
//           child: Text(
//             day,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }