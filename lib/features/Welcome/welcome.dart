import 'dart:async';

import 'package:SL_Explorer/features/authentication/screens/extra_questions_page.dart';
import 'package:SL_Explorer/features/authentication/screens/login_page.dart';
import 'package:SL_Explorer/features/home/round_trips/screens/round_trips_list_page.dart';
import 'package:SL_Explorer/question_gender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageController;
  int currentImageIndex = 0;

  List<String> imageUrlList = [
      "assets/images/image1.jpg",
      "assets/images/image2.jpg",
      "assets/images/image2.jpg",
    "assets/images/image4.jpg",
    "assets/images/image5.jpg",
     ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      changeBackgroundImage();
    });
  }

  void changeBackgroundImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % imageUrlList.length;
      _pageController.animateToPage(
        currentImageIndex,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: imageUrlList.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  imageUrlList[index],
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Plan your',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Luxurious\nVacation',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(LoginPage());
                      // Get.to(ExtraQuestionsPage());
                      // Get.to(RoundTripListPage());
                    },
                    child: Container(
                      height: 48.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Color(0xFFFD8103),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up Free',
                          style: GoogleFonts.inter(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
