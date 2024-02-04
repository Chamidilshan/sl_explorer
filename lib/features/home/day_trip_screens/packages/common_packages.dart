import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CommonPage extends StatefulWidget {
  final String pageTitle;
  final List<String> imagePaths;
  final String pageText;
  final List<bool> availability;
  final List<Service> services;
  final String hotelName;
  final String hotelImage;
  final String hotelDescription;
  final String bottomBarText;

  CommonPage({
    required this.pageTitle,
    required this.imagePaths,
    required this.pageText,
    required this.availability,
    required this.services,
    required this.hotelName,
    required this.hotelImage,
    required this.hotelDescription,
    required this.bottomBarText,
  });

  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  String tourType = '';
  String? selectedValue;
  DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;

  final List<String> items = [
    '1',
    '2',
    '3',
    '4',
  ];

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    DateTime selectedDate = DateTime.now();
    bool isDateSelected = false;

    final List<String> items = [
      '1',
      '2',
      '3',
      '4',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
    ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0,
          ),
          child: Column(
            children: [
              ImageSlider(imagePaths: widget.imagePaths),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                widget.pageText,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF21231E),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              DatesExpansionTile(availability: widget.availability),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ServicesListTile(services:widget.services),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              HotelsExpansionTile(
                hotelName: widget.hotelName,
                hotelImage: widget.hotelImage,
                hotelDescription: widget.hotelDescription,
              ),
            ],
          ),
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
                  widget.bottomBarText,
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
                        color: Colors.transparent,
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
                                       // _selectDate(context);
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Select Adults:',
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
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        SizedBox(height: 16),
                                        const Text(
                                          'from/to location & hotel:',
                                          style: TextStyle(fontSize: 18.0),
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
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    const TextField(
                                      maxLines: 5, // Set the maximum number of lines
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Type here...',
                                      ),
                                    ),
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


class ImageSlider extends StatefulWidget {
  final List<String> imagePaths;

  const ImageSlider({required this.imagePaths, Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
          setState(() {
            _current = position;
          });
        },
        enableInfiniteScroll: false,
      ),
      items: widget.imagePaths.map<Widget>((i) {
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
    );
  }
}

class DatesExpansionTile extends StatelessWidget {
  final List<bool> availability;

  const DatesExpansionTile({required this.availability, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        collapsedIconColor: logoColor,
        title: SizedBox(
          child: Text(
            'Avaliable Dates',
            style: GoogleFonts.poppins(
              color: logoColor,
              fontSize: 22.0,
            ),
          ),
        ),
        children: [
          Text('Avaliable Dates are in Green',style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.025,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: MediaQuery.of(context).size.height * 0.001,
          ),),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                vertical: _height * 0.02, horizontal: _width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDayBox('Mon', availability[0]),
                _buildDayBox('Tue', availability[1]),
                _buildDayBox('Wed', availability[2]),
                _buildDayBox('Thu', availability[3]),
                _buildDayBox('Fri', availability[4]),
                // Add more days as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayBox(String day, bool isAvailable) {
    Color boxColor = isAvailable ? Colors.green : Colors.red;

    return Container(
      width: 40,
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
    );
  }
}

class ServicesListTile extends StatelessWidget {
  final List<Service> services;

  ServicesListTile({required this.services});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        collapsedIconColor: logoColor,
        title: SizedBox(
          child: Text(
            'Facilities',
            style: GoogleFonts.poppins(
              color: logoColor,
              fontSize: 22.0,
            ),
          ),
        ),
        children: [
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
          ),
        ],
      ),
    );
  }
}

class Service {
  final String description;

  Service({this.description = ''});
}

class HotelsExpansionTile extends StatelessWidget {
  final String hotelName;
  final String hotelImage;
  final String hotelDescription;

  const HotelsExpansionTile({
    required this.hotelName,
    required this.hotelImage,
    required this.hotelDescription,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
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
          ListTile(
            title: Text(hotelName),
            subtitle: Text(hotelDescription),
            leading: Image.asset(hotelImage),
          ),
          // Add any other widgets or customization needed
        ],
      ),
    );
  }
}
