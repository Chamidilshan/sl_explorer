import 'package:SL_Explorer/features/home/day_trip_screens/packages/common_packages.dart';
import 'package:flutter/material.dart';

class Cycling_South_CoastP2 extends StatelessWidget {
  const Cycling_South_CoastP2({super.key});

  @override
  Widget build(BuildContext context) {

      List<Service> myServices = [
        Service(description: 'Description for Service 1'),
        Service(description: 'Description for Service 2'),
      ];
      List<String> imagePaths = [
        'assets/images/galle_fort.jpg',
        'assets/images/galle_fort.jpg',
      ];
      return CommonPage(
        pageTitle: 'Cycling Tour Wadduwa & Kalutara ',
        imagePaths: imagePaths,
        pageText: 'Explore inland villages via TucTuc after breakfast at 9:30 a.m. Discover quaint houses, local shops, and visit a bakery, coconut oil mill, rope factory, and broom maker.\n\nPass by scenic rice fields, lakes, and ponds with water buffaloes. Visit a village temple and enjoy a canoe ride amidst bird sightings. Conclude with a delightful lunch featuring homemade rotis or a flavorful rice and curry by Renuka',
        availability: [false, true, true, false, false],
        services: myServices,
        hotelName: 'Hotel 1',
        hotelImage: 'assets/images/galle_fort.jpg',
        hotelDescription: 'Description for Hotel 1',
        bottomBarText: 'From\n€35/person',
      );
    }
  }

