import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:SL_Explorer/features/home/round_trips/widgets/rooms_count_selection.dart';
import 'package:SL_Explorer/models/orders_model.dart';
import 'package:SL_Explorer/models/round_trip_packages_model.dart';
import 'package:SL_Explorer/services/api_services/orders_api_service.dart';
import 'package:SL_Explorer/services/firebase_services/authentication_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/api_services/round_trips_service.dart';

class RoundTripsDetailsPage extends StatefulWidget {
  final RoundTrip roundTrip;

  const RoundTripsDetailsPage({
    super.key,
    required this.roundTrip
  });

  @override
  State<RoundTripsDetailsPage> createState() => _RoundTripsDetailsPageState();
}

class _RoundTripsDetailsPageState extends State<RoundTripsDetailsPage> {

  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  String selectedLocation = 'Ella';
  String selectedRoomDescription = 'Ella';
  String selectedLocationDescription = 'Ella';
  String selectedHotelName = 'Ella';
  // String selectedImage = widget.roundTrip.hotels[0].hotel.;
  String? selectedAdultCount = '0';
  String? selectedChildCount = '0';

  final List<String> childCount = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6'
  ];


  final List<String> adultCount = [
    '0',
    '1',
    '2',
    '3',
    '4',
  ];

  int selectedSingleRooms = 0;
  int selectedDoubleRooms = 0;
  int selectedTripleRooms = 0;

  double totalRoomsPrice = 0;

  double calculateRoomPrice(String roomType, int roomCount) {
    double roomPrice;

    switch (roomType) {
      case 'Single':
        roomPrice = widget.roundTrip.prices!.private!.single!.toDouble();
        break;
      case 'Double':
        roomPrice = widget.roundTrip.prices!.private!.double!.toDouble();
        break;
      case 'Triple':
        roomPrice = widget.roundTrip.prices!.private!.triple!.toDouble();
        break;

      default:
      // Handle invalid room types
        roomPrice = 0.0; // or throw an exception, depending on your use case
        break;
    }

    return roomPrice * roomCount;
  }




  OrderApiService apiService = OrderApiService();

  @override
  void initState(){
    super.initState();
    loadHotelValues();
  }

  loadHotelValues(){
    selectedHotelName = widget.roundTrip.hotels![0].hotel!.hotelName.toString();
    selectedRoomDescription = widget.roundTrip.hotels![0].hotelRoomDesc.toString();
    selectedLocationDescription = widget.roundTrip.hotels![0].hotelLocationDesc.toString();
  }




  int selectedDay = 0;
  int index = 0;

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
              items: widget.roundTrip.packageImageLinks!.map<Widget>((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          item, // Assuming each item has only one image link
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
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.roundTrip.packageName.toString(),
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${widget.roundTrip.packageTitle} | ${widget.roundTrip.packageSubTitle}',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF666666),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.roundTrip.packageCoverDescription.toString(),
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF21231E),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Add more content as needed
                ],
              ),
            ),
            ExpansionTile(
              collapsedIconColor: logoColor,
              title: SizedBox(
                child: Text(
                  'Itinerary',
                  style: GoogleFonts.poppins(
                    color: logoColor,
                    fontSize: 22.0,
                  ),
                ),
              ),
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // for (var itineraryDay in widget.roundTrip.itenary)
                      //   RoundedButton(
                      //     text: itineraryDay.dayNumber.toString(),
                      //     isSelected: selectedDay == itineraryDay.dayNumber,
                      //     onPressed: () {
                      //       setState(() {
                      //         print(itineraryDay.dayNumber);
                      //         selectedDay = itineraryDay.dayNumber.toString() as int;
                      //       });
                      //     },
                      //     dateName: '',
                      //   ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Text(
                    widget.roundTrip.itenary![index].description.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
            ExpansionTile(
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
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Departure 09:30 hrs +/-',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'AbhayaLibreMedium',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A544F),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '• Pick-up directly at the ship',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'AbhayaLibreMedium',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A544F),
                      ),
                    ),
                    Text(
                      '• Travel by air-conditioned coach',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'AbhayaLibreMedium',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A544F),
                      ),
                    ),
                    Text(
                      '• English-speaking Sri Lanka Explorer Tour Guide',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'AbhayaLibreMedium',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A544F),
                      ),
                    ),
                    // Add more points similarly
                    SizedBox(height: 8),
                    Text(
                      'No minimum number of participants - max. 20 people',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'AbhayaLibreMedium',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A544F),
                      ),
                    ),
                    Text(
                      '€ 85 per adult',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'AbhayaLibreMedium',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A544F),
                      ),
                    ),
                    Text(
                      '€ 55 per child up to 11 years',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'AbhayaLibreMedium',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A544F),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Ship layover: 09:00-19:00',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'AbhayaLibreMedium',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A544F),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                )

              ],
            ),
            ExpansionTile(
              collapsedIconColor: logoColor,
              title: SizedBox(
                child: Text(
                  'Hotels',
                  style: GoogleFonts.poppins(
                    color: logoColor,
                    fontSize: 22.0,
                  ),
                ),
              ),
              children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.roundTrip.hotels!.map((hotel) {
                  return HotelLocation(
                    locationName: hotel.hotel!.hotelDistrict.toString(),
                    image: hotel.hotel!.hotelImage.toString(),
                    onSelect: () {
                      setState(() {
                        selectedLocation = hotel.hotelLocationDesc!;
                        selectedHotelName = hotel.hotel!.hotelName.toString();
                        selectedLocationDescription = hotel.hotelLocationDesc.toString();
                        selectedRoomDescription = hotel.hotelRoomDesc.toString();
                        // selectedImage = hotel.hotel.hotelImage.toString();
                      });
                    },
                  );
                }).toList(),
                            ),
              ),
                HotelDetails(
                  location: selectedLocation,
                  hotelName: selectedHotelName,
                  hotelRoomsDesc: selectedRoomDescription,
                  hotelLocationDesc: selectedLocationDescription,
                  // imageLink: selectedImage
                ),
              ],
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height*0.10,
            )
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
                      builder: (context){
                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState){
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.75,
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Select your perfered date',
                                              style: TextStyle(
                                                fontSize: 16.0
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                _selectDate(context);
                                                setState(){

                                                }
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4.0),
                                                      border: Border.all(color: const Color(0xFF8C8C8C))

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
                                                      const Padding(
                                                        padding: EdgeInsets.only(right: 20.0),
                                                        child: Icon(
                                                            Icons.calendar_month
                                                        ),
                                                      )
                                                    ],
                                                  )
                                              ),
                                            ),
                                            const SizedBox(height: 20.0),
                                            Center(
                                              child: Text(
                                                'Available Seats : 12',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'Select adults:',
                                                        style: TextStyle(fontSize: 16.0),
                                                      ),
                                                      const SizedBox(height: 8.0),
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton2<String>(
                                                          isExpanded: true,
                                                          hint: Text(
                                                            '',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: Theme.of(context).hintColor,
                                                            ),
                                                          ),
                                                          items: adultCount
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
                                                          value: selectedAdultCount,
                                                          onChanged: (String? value) {
                                                            setState(() {
                                                              selectedAdultCount = value;
                                                            });
                                                          },
                                                          buttonStyleData:  ButtonStyleData(
                                                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'Select Children:',
                                                        style: TextStyle(fontSize: 16.0),
                                                      ),
                                                      const SizedBox(height: 8.0),
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton2<String>(
                                                          isExpanded: true,
                                                          hint: Text(
                                                            '',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: Theme.of(context).hintColor,
                                                            ),
                                                          ),
                                                          items: childCount
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
                                                          value: selectedChildCount,
                                                          onChanged: (String? value) {
                                                            setState(() {
                                                              selectedChildCount = value;
                                                            });
                                                          },
                                                          buttonStyleData:  ButtonStyleData(
                                                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                            const SizedBox(height: 16.0),
                                            RoomsSelection(
                                              itemName: 'Single Room',
                                              roomPrice: widget.roundTrip.prices!.private!.single!.toDouble(),
                                              onCountChanged: (count){
                                                selectedSingleRooms = count;
                                              },
                                            ),
                                            const SizedBox(height: 8.0),
                                            RoomsSelection(
                                              itemName: 'Double Room',
                                              roomPrice: widget.roundTrip.prices!.private!.double!.toDouble(),
                                                onCountChanged: (count){
                                                    selectedDoubleRooms = count;
                                                    print(selectedDoubleRooms);
                                                }
                                            ),
                                            const SizedBox(height: 8.0),
                                            RoomsSelection(
                                              itemName: 'Triple Room',
                                              roomPrice: widget.roundTrip.prices!.private!.triple!.toDouble(),
                                                onCountChanged: (count){
                                                  selectedTripleRooms = count;
                                                  print(selectedTripleRooms);
                                                }
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                  'Add to Cart',
                                                style: TextStyle(
                                                  fontSize: 16.0
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            ElevatedButton(
                                                onPressed: () async{

                                                  double totalSingleRoomsPrice = calculateRoomPrice('Single', selectedSingleRooms);
                                                  double totalDoubleRoomsPrice =  calculateRoomPrice('Double', selectedDoubleRooms);
                                                  double totalTripleRoomsPrice =  calculateRoomPrice('Double', selectedTripleRooms);

                                                  double totalPrice = totalSingleRoomsPrice + totalDoubleRoomsPrice + totalTripleRoomsPrice;
                                                  print('total price $totalPrice');

                                                  String orderDate = DateTime.now().toString();
                                                  String tripDate = selectedDate.toString();
                                                  Map<String, String> packageId = {'roundTrip': widget.roundTrip.id.toString()};
                                                  Map<String, int> noOfPeople = {'adults': int.parse(selectedAdultCount.toString()), 'children': int.parse(selectedChildCount.toString())};
                                                  Map<String, int> rooms = {'single': selectedSingleRooms, 'double': selectedDoubleRooms, 'triple': selectedTripleRooms, 'Quadruple': 0};
                                                  String status = "Pending";
                                                  Map<String, double> price = {'shownPrice': totalPrice};
                                                  Map<String, dynamic> advance = {'isPaid': false};
                                                  Map<String, dynamic> option = { "name": "Beach Hotel", "amount": 110};

                                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                                  String? token = prefs.getString('fcmToken');
                                                  print('token is $token');


                                                  final order = OrderRequest(
                                                      customerId: AuthenticationRepository.instance.userId.toString(),
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
                                                      borderRadius: BorderRadius.circular(12.0)),
                                                  minimumSize: const Size(100, 56.0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Book Now',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        fontStyle: FontStyle.italic
                                                    ),
                                                  ),
                                                ),
                                            ),
                                            SizedBox(
                                              height: 40.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              );
                            }
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

  void _showServiceDialog(BuildContext context, String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Service Details'),
          content: Text(details),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
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
          backgroundColor: isSelected ? Colors.white.withOpacity(0.75): const Color(0xFF9E9E9E).withOpacity(0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
            'Day $text',
          style: const TextStyle(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}


class ServiceContainer extends StatefulWidget {
  final String serviceName;
  final VoidCallback onTap;

  ServiceContainer({
    required this.serviceName,
    required this.onTap,
  });

  @override
  _ServiceContainerState createState() => _ServiceContainerState();
}

class _ServiceContainerState extends State<ServiceContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap();
      },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: const Color(0xFFC9C9C9).withOpacity(0.25),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.white,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 30,
              color: Colors.blue,
            ),
            const SizedBox(height: 5),
            Text(
              widget.serviceName,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class HotelLocation extends StatelessWidget {
  final String locationName;
  final String image;
  final VoidCallback onSelect;

  HotelLocation({
    required this.locationName,
    required this.image,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
      child: GestureDetector(
        onTap: onSelect,
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(image),
            ),
            const SizedBox(height: 5),
            Text(
                locationName,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelDetails extends StatelessWidget {
  final String location;
  final String hotelName;
  final String hotelRoomsDesc;
  final String hotelLocationDesc;
  // final String imageLink;

  HotelDetails({
    required this.location,
    required this.hotelName,
    required this.hotelRoomsDesc,
    required this.hotelLocationDesc,
    // required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center(
          //   child: Image.network(
          //     // 'assets/hotel_image_$location.jpg', // Replace with actual image path
          //     imageLink,
          //     height: 100,
          //   ),
          // ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              children: [
                const TextSpan(text: 'Hotel Name - '),
                TextSpan(text: '$hotelName', style: const TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              children: [
                const TextSpan(text: 'Rooms Description - '),
                TextSpan(text: '$hotelRoomsDesc', style: const TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              children: [
                const TextSpan(text: 'Location Description - '),
                TextSpan(text: '$hotelLocationDesc', style: const TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
          ),

          const SizedBox(height: 20.0),
          const SizedBox(height: 20.0),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     HotelDetailRow(title: 'Layer', description: 'Description about Layer'),
          //     HotelDetailRow(title: 'Hotel', description: 'Description about Hotel'),
          //     HotelDetailRow(title: 'Room', description: 'Description about Room'),
          //     HotelDetailRow(title: 'Catering', description: 'Description about Catering'),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class HotelDetailRow extends StatelessWidget {
  final String title;
  final String description;

  HotelDetailRow({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Hello world'),
        const SizedBox(width: 5),
        Flexible(
          child: Text(description),
        ),
      ],
    );
  }
}






