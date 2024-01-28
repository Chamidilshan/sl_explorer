import 'package:SL_Explorer/features/home/day_trip_screens/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class East_CoastPage extends StatelessWidget {
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
      pageTitle: 'Excursions East Coast',
      tabTitles: ['One Day', 'Two Days', 'Three Days'],
      tabContents: [
        [
          TripDetails(
            title: 'Sigiriya & Safari',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Anuradhapura & Mihintale',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Polonnaruwa & Safari',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Village Tour & Pidurangala',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Sigiriya & Dambulla',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 2',
          ),
        ],

        [
          TripDetails(
            title: 'Cultural Triangle Highlands',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Tea Plantations Kandy & Dambulla',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
          TripDetails(
            title: 'Anuradhapura & Wilpattu Safari',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
        ],

        [
          TripDetails(
            title: '5 Royal Cities',
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
          TripDetails(
            title: 'Migratory Birds',
            imagePath: 'assets/images/galle_fort.jpg',
            description: 'Description 1',
          ),
        ],
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
      additionalText: 'from/to Kalkudah & Passikudah, Trincomalee',
    );
  }
}
