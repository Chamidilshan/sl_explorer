import 'package:SL_Explorer/features/home/day_trip_screens/common_list.dart';
import 'package:SL_Explorer/features/home/day_trip_screens/common_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class North_West_CoastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PopupTrip> oneDayTrips = [
      PopupTrip(
        title: 'Colombo',
        description: '15.02. / 05.03.  from €65',
        durationInDays: 1,
      ),
      PopupTrip(
        title: 'Yala Afternoon Safari',
        description: '23.01.  from €159',
        durationInDays: 1,
      ),
      PopupTrip(
        title: 'Kandy and Pinnawela',
        description: '31.01. / 07.03  rom € 59',
        durationInDays: 2,
      ),
    ];
    return CommonListPage(
      itemCountsByTab: const [2, 3, 3],
      pageTitle: 'Excursions North-West Coast',
      tabTitles: const [
        'One Day',
        'Two Days',
        'Three Days',
      ],
      titlesByDuration: const [
        ['Title 1a', 'Title 1b'],
        ['Title 2a', 'Title 2b', 'Title 2c'],
        ['Title 3a', 'Title 3b', 'Title 3c', 'Title 3d'],
      ],
      descriptionsByDuration: const [
        ['Description 1a', 'Description 1b'],
        ['Description 2a', 'Description 2b', 'Description 2c'],
        ['Description 3a', 'Description 3b', 'Description 3c', 'Description 3d'],
      ],
      imagePathsByDuration: const [
        ['assets/images/roundTrip.png', 'assets/images/roundTrip.png'],
        ['assets/images/roundTrip.png', 'assets/images/roundTrip.png', 'assets/images/roundTrip.png'],
        ['assets/images/roundTrip.png', 'assets/images/roundTrip.png', 'assets/images/roundTrip.png'],
      ],



      onDoubleArrowTapped: (tabIndex, cardIndex) {
        if (tabIndex == 0) {
          if (cardIndex == 0) {
            // Get.to(DayTripHome());
          } else if (cardIndex == 1) {
            //  Get.to(DayTripHome());
          }
        } else if (tabIndex == 1) {
          if (cardIndex == 0) {
            //Get.to(DayTripHome());
          } else if (cardIndex == 1) {
            //Get.to(DayTripHome());
          }
        }
      },
      customButton: CustomButton(
        onPressed: () {
          PopupBuilder.showTripsPopup(context, 'Available Trips', oneDayTrips);
        },
      ),
      additionalText: 'from/to Negombo, Waikkal',
    );
  }
}
