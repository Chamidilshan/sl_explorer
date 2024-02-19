import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:SL_Explorer/features/home/Festivals/screens/festivals_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../models/festival_model.dart';

class TripListCard extends StatelessWidget {
  final String imgLink;
  final String titleText;
  final List<Festival> festival;
  final int index;
  const TripListCard({
    super.key,
    required this.imgLink,
    required this.titleText,
    required this.festival,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        trailing: IconButton(
          icon: Icon(Icons.keyboard_double_arrow_right_rounded),
          onPressed: (){
            Get.to(
                FestivalsDetailsPage(festival: festival[index],)
            );
          },
        ),
        collapsedIconColor: logoColor,
        title: SizedBox(
          height: 80.0,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imgLink,
                        fit: BoxFit.cover,
                      ),
                    )
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleText,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0
                        ),
                      ),
                    ],
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}