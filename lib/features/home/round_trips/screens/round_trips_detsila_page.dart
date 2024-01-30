import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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

  String selectedLocation = 'Ella';
  String? selectedValue;

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
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
                    'Sri Lanka Deluxe',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '9 Days | 5 Nights',
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
                    "Discover our beautiful island in many ways! The wild waves of the beaches, the spiritual tranquility during yoga or meditation. Experience the allure of our island with diverse activities.",
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
                const SizedBox(height: 20),
                Text(
                  dayDetails[selectedDay] ?? '',
                  style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
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
              children: [
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(text: 'Included'),
                          Tab(text: 'Not Included')
                        ],
                        indicatorColor: Colors.black,
                        indicatorPadding: EdgeInsets.zero,
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        dividerColor: Colors.transparent,
                        unselectedLabelStyle: TextStyle(
                            color: Color(0x80000000),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 180.0,
                        child: TabBarView(
                          children: [
                            // Included tab content
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Wrap(
                                spacing: 16.0,
                                runSpacing: 16.0,
                                children: [
                                  ServiceContainer(
                                    serviceName: 'Service 1',
                                    onTap: () =>
                                        _showServiceDialog(context, 'Service 1 Details'),
                                  ),
                                  ServiceContainer(
                                    serviceName: 'Service 2',
                                    onTap: () =>
                                        _showServiceDialog(context, 'Service 2 Details'),
                                  ),
                                  ServiceContainer(
                                    serviceName: 'Service 2',
                                    onTap: () =>
                                        _showServiceDialog(context, 'Service 2 Details'),
                                  ),
                                  ServiceContainer(
                                    serviceName: 'Service 2',
                                    onTap: () =>
                                        _showServiceDialog(context, 'Service 2 Details'),
                                  ),
                                  ServiceContainer(
                                    serviceName: 'Service 2',
                                    onTap: () =>
                                        _showServiceDialog(context, 'Service 2 Details'),
                                  ),
                                  ServiceContainer(
                                    serviceName: 'Service 2',
                                    onTap: () =>
                                        _showServiceDialog(context, 'Service 2 Details'),
                                  ),
                                  ServiceContainer(
                                    serviceName: 'Service 2',
                                    onTap: () =>
                                        _showServiceDialog(context, 'Service 2 Details'),
                                  ),
                                ],
                              ),
                            ),
                            // Not Included tab content
                            Container(
                              child: const Center(
                                child: Text('Content for Not Included Tab'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HotelLocation(
                      locationName: 'Ella',
                      image: 'assets/ella_image.jpg',
                      onSelect: () {
                        setState(() {
                          selectedLocation = 'Ella';
                        });
                      },
                    ),
                    HotelLocation(
                      locationName: 'Another Location',
                      image: 'assets/another_location_image.jpg',
                      onSelect: () {
                        setState(() {
                          selectedLocation = 'Another Location';
                        });
                      },
                    ),
                  ],
                ),
                HotelDetails(
                  location: selectedLocation,
                ),
              ],
            ),
            const SizedBox(
              height: 60.0,
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
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: isSelected ? Colors.white.withOpacity(0.75): const Color(0xFF9E9E9E).withOpacity(0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
            text,
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
    return GestureDetector(
      onTap: onSelect,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(height: 5),
          Text(locationName),
        ],
      ),
    );
  }
}

class HotelDetails extends StatelessWidget {
  final String location;

  HotelDetails({
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            // 'assets/hotel_image_$location.jpg', // Replace with actual image path
            'assets/images/roundTrip.png',
            height: 100,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Hotel Name - $location',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HotelDetailRow(title: 'Layer', description: 'Description about Layer'),
            HotelDetailRow(title: 'Hotel', description: 'Description about Hotel'),
            HotelDetailRow(title: 'Room', description: 'Description about Room'),
            HotelDetailRow(title: 'Catering', description: 'Description about Catering'),
          ],
        ),
      ],
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