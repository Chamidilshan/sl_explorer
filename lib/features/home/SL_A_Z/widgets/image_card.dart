import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:SL_Explorer/features/home/SL_A_Z/Screens/sl_A_Z.dart';
import 'package:SL_Explorer/models/a_z_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class A_Z_Card extends StatelessWidget {
  final String imgLink;
  final String titleText;
  final String carddescription;
  final List<A_Z> a_zs;
  final int index;

  const A_Z_Card({
    super.key,
    required this.imgLink,
    required this.titleText,
    required this.carddescription,
    required this.a_zs,
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
           // Get.to();
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
                      Flexible(
                        flex:10,
                        child: Text(
                          titleText,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                )
              ]
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 24.0, left: 24.0, bottom: 8.0),
            child: Text(
              carddescription,
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
