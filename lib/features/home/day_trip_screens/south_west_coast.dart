import 'package:SL_Explorer/features/home/day_trip_screens/custom_page.dart';
import 'package:SL_Explorer/features/home/day_trip_screens/packages/wadduwa_village_South_Coast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'packages/cycling_South_Coast.dart';

class South_West_CoastPage extends StatelessWidget {
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
    return CustomPage(
      pageTitle: 'Excursions South-West Coast',
      tabTitles: ['One Day', 'Two Days', 'Three Days'],
      tabContents: [
        [
          TripDetails(
            title: 'Wadduwa Village Tour',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'A little look into our village life.There is a lot to discover on our trip around Wadduwa gggggggggggggggggghhhhhh',
          ),
          TripDetails(
            title: 'Cycling in Wadduwa & Kalutara',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Bentota & Surroundings',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Colombo',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Galle & Southwest Coast',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 2',
          ),
          TripDetails(
            title: 'Wahles & Bile',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Kandy & Pinnawela',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Udawalawa & Yala day Safari',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Sigiriya Lion Rock',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Adams Peak',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 2',
          ),
          TripDetails(
            title: 'Sinharaja Rainforest',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
        ],

        [
          TripDetails(
            title: 'Ella & Highland',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Kandy & Tea Highlands',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Yala & Galle',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Cultural Triangle with Safari',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Cultural Triangle Reloaded',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Pure Nature',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
        ],
        [
          TripDetails(
            title: 'Migratory Birds',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Sigiriya, Kandy & Tea Highlands',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Pinnawela, Kandy & Adams Peak',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
        ],
      ],
      onDoubleArrowTapped: (tabIndex, cardIndex) {
        if (tabIndex == 0) {
          if (cardIndex == 0) {
            Get.to(Wadduwa_South_CoastP1());
          } else if (cardIndex == 1) {
            Get.to(Cycling_South_CoastP2());
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
      additionalText: 'from/to Colombo, Wadduwa\nWaskaduwa, Kalutara, Beruwela, Bentota\nInduruwa, Ahungalla & Balapitiya',
    );
  }
}
