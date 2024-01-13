import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SuccessVerificationScreen extends StatefulWidget {
  const SuccessVerificationScreen({super.key});

  @override
  State<SuccessVerificationScreen> createState() => _SuccessVerificationScreenState();
}

class _SuccessVerificationScreenState extends State<SuccessVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40.0,
          ),
          Center(
            child: Lottie.asset(
                'assets/images/successJson.json',
              height: 360.0
            )
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your Account Verified Successfully',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF262626),
                      fontSize: 20.0
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Congratulations on successfully verifying your account. You\'re now ready to explore the beauty of Sri Lanka with SL Explorer App',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF262626),
                      fontSize: 14.0
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: InkWell(
              onTap: (){
                // controller.checkEmailVerificationStatus();
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
                    'Continue',
                    style: GoogleFonts.inter(
                        fontSize: 16.0,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
