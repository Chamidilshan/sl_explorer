import 'package:SL_Explorer/features/home/day_trip_screens/common_list.dart';
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
    return CommonListPage(
      itemCountsByTab: const [11,6,3],
      pageTitle: 'Excursions South-West Coast',
      tabTitles: const [
        'One Day',
        'Two Days',
        'Three Days',
      ],
      titlesByDuration: const [
        [
          'Wadduwa Village Tour',
          'Cycling Tour Wadduwa&Kalutara',
          'Bentota & Surroundings',
          'Colombo',
          'Galle & Southwest Coast',
          'Whales & Bile',
          'Kandy & Pinnawala',
          'Udawalawa Or Yala Day Safari',
          'Sigirya Lion Rock',
          'Sinharaja Rainforest',
          'Adams Peak'
        ],

        ['Ella & Highland',
          'Kandy & Tea Highlands',
          'Yala & Galle',
          'Cultural triangle with safari',
          'Cultural Triangle Reloaded',
          'Pure Nature'],
        ['migratory bids',
          'Sigiiriya,Kandy & Tea Highllands',
          'Pinnawala, Kandy & Adams Peak'],
      ],
      descriptionsByDuration: const [
        ['A little look into our village life.There is a lot to discover on our trip around Wadduwa.',
          'No mercy for the calf, but lots of wonderful impressiona of the county and its people',
          'Description 2a',
          'Description 2a',
          'Description 2a',
          'Description 2a',
          'Description 2a',
          'Description 2a',
          'Description 2a',
          'Description 2a',
          'Description 2a'],
        ['A little look into our village life.There is a lot to discover on our trip around Wadduwa.',
          'No mercy for the calf, but lots of wonderful impressiona of the county and its people',
          'Description 2b',
          'Description 2c',
          'Description 2a',
          'Description 2b'],
        [
          'Description 3a',
          'Description 3b',
          'Description 3c'
        ],
      ],
      imagePathsByDuration: const [
        ['https://www.idlebikes.com/assets/hero-1.jpg',
          'https://media.istockphoto.com/id/1317225295/photo/pov-of-tourists-exploring-sightseeing-in-sri-lanka-with-bicycle.jpg?s=612x612&w=0&k=20&c=RAHbP6t9hkywHVLZBRtXTaegS0-5NGPKj-HSEY-H79Y=',
          'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/SL_Explorer%20Images%2FSurfing%20Sri%20Lanka.jpeg?alt=media&token=a9497064-a20d-4b27-bd68-453cc05613c2',
          'https://media.istockphoto.com/id/522148349/photo/colombo-skyline.jpg?s=612x612&w=0&k=20&c=yZptq7SuDj_nOxkVd4i7ieaJvSwPgrDHsFu6ph6Z1_8=',
          'https://media.istockphoto.com/id/472387838/photo/galle-fort-lighthouse-sri-lanka.webp?b=1&s=170667a&w=0&k=20&c=RA4EazDXDbPnhgRAnmwCeiUEhFLIwzJTjBVFc4mNxNw=',
          'https://whc.unesco.org/uploads/thumbs/site_0450_0020-1200-630-20151105154018.jpg',
          'https://whc.unesco.org/uploads/thumbs/site_0450_0020-1200-630-20151105154018.jpg',
          'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/SL_Explorer%20Images%2FAdobeStock_159898876.jpeg?alt=media&token=133828dd-90c3-4c24-8e0e-95d6c86fafe3',
          'https://res.klook.com/image/upload/c_fill,w_627,h_470/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/muqzinlhem1y4kem2aiz.webp',
          'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/SL_Explorer%20Images%2FAdobeStock_146377673.jpeg?alt=media&token=f3bfe504-49b1-444d-9974-c19749aa78d3',
          'https://res.klook.com/image/upload/c_fill,w_627,h_470/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/muqzinlhem1y4kem2aiz.webp'],
        [
          'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/SL_Explorer%20Images%2FAdobeStock_296267636.jpeg?alt=media&token=da0c8e66-3a6f-4d95-b9c7-c0eacd84c26a',
          'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/SL_Explorer%20Images%2FAdobeStock_181205487.jpeg?alt=media&token=ff555b27-4d5c-4508-91bb-f654e1353490',
          'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/SL_Explorer%20Images%2FAdobeStock_193285545%20(1).jpeg?alt=media&token=0c16beab-b09c-4897-af7b-ed6fe09a56aa',
          'https://res.klook.com/image/upload/c_fill,w_627,h_470/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/muqzinlhem1y4kem2aiz.webp',
          'https://res.klook.com/image/upload/c_fill,w_627,h_470/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/muqzinlhem1y4kem2aiz.webp',
          'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/SL_Explorer%20Images%2FAdobeStock_85326142.jpeg?alt=media&token=8df87381-4240-472e-8279-f55ed85ea6f4',
        ],
        [
          'https://res.klook.com/image/upload/c_fill,w_627,h_470/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/muqzinlhem1y4kem2aiz.webp',
          'https://res.klook.com/image/upload/c_fill,w_627,h_470/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/muqzinlhem1y4kem2aiz.webp',
          'https://res.klook.com/image/upload/c_fill,w_627,h_470/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/muqzinlhem1y4kem2aiz.webp',
        ],
      ],


      onDoubleArrowTapped: (tabIndex, cardIndex) {
        if (tabIndex == 0) {
          if (cardIndex == 0) {
            Get.to(Wadduwa_South_CoastP1());
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
      additionalText: 'from/to Colombo, Wadduwa, Waskaduwa, Kalutara, Beruwela, Bentota, Induruwa, Ahungalla & Balapitiya',
    );
  }
}