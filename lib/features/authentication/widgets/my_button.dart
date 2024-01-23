import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget{
  final Function()? onTap;
  final String btnText;


  const MyButton({
    super.key,
    required this.onTap,
    required this.btnText
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color(0xFFFD8103),
        ),
        child: Center(
          child: Text(
            btnText,
            style: GoogleFonts.inter(
                fontSize: 16.0,
                color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );

}
}
