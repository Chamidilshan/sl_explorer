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
    'https://images.unsplash.com/photo-1522310570852-0b661319089c?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1592905169881-eff95fe441ed?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1701544857566-dd1d044b9dea?q=80&w=1500&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1574611122955-5baa61496637?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1586963306223-51f28ba54028?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
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
                return Image.network(
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
                      //Get.to(RoundTripListPage());
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
