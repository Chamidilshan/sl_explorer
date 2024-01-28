import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class CommonPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            height: MediaQuery.of(context).size.height * 0.001,
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
              ImageSlider(imagePaths: imagePaths),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                pageText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              DatesExpansionTile(availability: availability),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ServicesListTile(services: services),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              HotelsExpansionTile(
                hotelName: hotelName,
                hotelImage: hotelImage,
                hotelDescription: hotelDescription,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                bottomBarText,
                style: TextStyle(
                  color: Color(0xFFfd8103),
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: MediaQuery.of(context).size.height * 0.0015,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //Get.to(NorthWestBook());
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFfd8103),
                onPrimary: Colors.white,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Book Now ',style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),

          ],
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
        title: Container(
          color: const Color(0xFFfd8103),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Available Dates',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
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
        title: Container(
          color: const Color(0xFFfd8103),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Services',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        children: services
            .map(
              (service) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (service.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: RichText(
                          text: TextSpan(
                            text: '• ',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: service.description,
                                style:TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                  ],
                ),
              ),
            )
            .toList(),
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
        title: Container(
          color: const Color(0xFFfd8103),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Hotels',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
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
