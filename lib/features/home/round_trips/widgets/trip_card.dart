import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripListCard extends StatelessWidget {
  final String imgLink;
  final String titleText;
  final String firstSubTitleText;
  final String secondSubTitleText;
  final String descriptionText;
  const TripListCard({
    super.key,
    required this.imgLink,
    required this.titleText,
    required this.firstSubTitleText,
    required this.secondSubTitleText,
    required this.descriptionText,
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
            // Get.to(
            //     RoundTripsDetailsPage()
            // );
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
                      child: Image.asset(
                        imgLink,
                        fit: BoxFit.cover,
                      ),
                    )
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    Text(
                      firstSubTitleText,
                      style: GoogleFonts.poppins(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0
                      ),
                    ),
                    Text(
                      secondSubTitleText,
                      style: GoogleFonts.poppins(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0
                      ),
                    )
                  ],
                )
              ]
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 24.0, left: 24.0, bottom: 8.0),
            child: Text(
              descriptionText,
              style: GoogleFonts.poppins(
                  color: Color(0xFF21231E),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
          // const Text("isAdmin: No")
        ],
      ),
    );
  }
}