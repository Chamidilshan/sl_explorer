import 'dart:async';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/utils/styles.dart';

class Maldives_Emirates extends StatefulWidget {
  @override
  _Maldives_EmiratesState createState() => _Maldives_EmiratesState();
}

class _Maldives_EmiratesState extends State<Maldives_Emirates> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  String selectedLocation = 'Ella';
  String? selectedValue;

// List of image URLs
  List<String> imageUrls = [
    'https://www.travelanddestinations.com/wp-content/uploads/2021/11/Maldives-islands-and-resorts-1024x684.jpg',
    'https://static1.evcdn.net/images/reduction/355607_w-3840_h-2160_q-70_m-crop.jpg',
    'https://cf.bstatic.com/xdata/images/hotel/max1024x768/465571045.jpg?k=02196325840def7cafaa7e4433e5a101dd117244001194c539ff9281d3b7b0a2&o=&hp=1'
    // Add more image URLs as needed
  ];

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

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
  void initState() {
    super.initState();
    // Set up a timer to automatically change the page
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 22.00,right: 22.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Headline using Text widget

              Container(
                height: 200.0, // Adjust the height as needed
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      imageUrls[index],
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      fit: BoxFit.cover,
                    );
                  },
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                ),
              ),
              const Text(
                'Sri lankan & Maldives',
                style: TextStyle(
                  fontSize: 25.0, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Customize the color

                ),
                textAlign: TextAlign.start,
              ),

              SizedBox(height: 16.0),

              Text(
                'Embark on a journey through Sri Lanka, where emerald tea plantations carpet the rolling hills, and majestic elephants roam freely in nature\'s embrace. Then, set sail to the Maldives, where pristine beaches and crystal-clear waters await your discovery.',

              ),
              SizedBox(height: 16.0),
              const Text(
                'Facilities',
                style: TextStyle(
                  fontSize: 23.0, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Customize the color

                ),
              ),
              // Your other widgets/content here
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
                  ), Text(
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
                          //could change this to Color(0xFF737373),
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
                                                borderRadius: BorderRadius
                                                    .circular(4.0),
                                                border: Border.all(
                                                    color: Color(0xFF8C8C8C))

                                            ),
                                            height: 44.0,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(left: 20.0),
                                                  child: Text(
                                                      isDateSelected ?
                                                      "${selectedDate
                                                          .toLocal()}".split(
                                                          ' ')[0]
                                                          : "Select a date"
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(right: 20.0),
                                                  child: Icon(
                                                      Icons.calendar_month
                                                  ),
                                                )
                                              ],
                                            )
                                        ),
                                      ),
                                      SizedBox(height: 20.0),

                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  'Select adults:',
                                                  style: TextStyle(
                                                      fontSize: 18.0),
                                                ),
                                                SizedBox(height: 8.0),
                                                DropdownButtonHideUnderline(
                                                  child: DropdownButton2<
                                                      String>(
                                                    isExpanded: true,
                                                    hint: Text(
                                                      'Select Item',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Theme
                                                            .of(context)
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
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16),
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
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  'Select Childs:',
                                                  style: TextStyle(
                                                      fontSize: 18.0),
                                                ),
                                                SizedBox(height: 8.0),
                                                DropdownButtonHideUnderline(
                                                  child: DropdownButton2<
                                                      String>(
                                                    isExpanded: true,
                                                    hint: Text(
                                                      'Select Item',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Theme
                                                            .of(context)
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
                                                    buttonStyleData: ButtonStyleData(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16),
                                                      height: 40,
                                                      width: 140,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(14),
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
                                                        borderRadius: BorderRadius
                                                            .circular(14),
                                                      ),
                                                      offset: const Offset(
                                                          -20, 0),
                                                      scrollbarTheme: ScrollbarThemeData(
                                                        radius: const Radius
                                                            .circular(40),
                                                        thickness: MaterialStateProperty
                                                            .all(6),
                                                        thumbVisibility: MaterialStateProperty
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