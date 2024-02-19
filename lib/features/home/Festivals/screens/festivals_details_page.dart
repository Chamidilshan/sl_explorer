import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:SL_Explorer/models/festival_model.dart';
import 'package:SL_Explorer/services/firebase_services/authentication_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FestivalsDetailsPage extends StatefulWidget {
  final Festival festival;
  const FestivalsDetailsPage({
    super.key,
    required this.festival

  });

  @override
  State<FestivalsDetailsPage> createState() => _FestivalsDetailsPageState();
}

class _FestivalsDetailsPageState extends State<FestivalsDetailsPage> {

  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.festival.festivalName,
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
            horizontal: MediaQuery.of(context).size.width * 0.06,
            vertical: MediaQuery.of(context).size.height * 0,
          ),
          child: Column(
            children: [
              ImageSlider(imageUrls: widget.festival.festivalImageLinks),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: logoColor,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.receipt_long, color: Colors.white),
                        SizedBox(width: 5.0),
                        Text(
                          'About',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Center(
                    child: Text(
                      widget.festival.festivalDescription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color(0xFF21231E),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: logoColor,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.date_range_outlined,color: Colors.white),
                        Text('Date',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Text(
                        widget.festival.festivalDate,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF21231E),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: logoColor,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.celebration_outlined,color: Colors.white),
                        Text('Celebrations',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    widget.festival.festivalTitle,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF21231E),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
class ImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  const ImageSlider({required this.imageUrls, Key? key}) : super(key: key);

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
      items: widget.imageUrls.map<Widget>((url) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  url,
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
