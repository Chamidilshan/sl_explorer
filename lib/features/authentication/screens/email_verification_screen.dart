import 'package:SL_Explorer/features/authentication/controllers/verify_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String? email;
  const EmailVerificationScreen({super.key, this.email});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 40.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'VERIFY',
                    style: GoogleFonts.abel(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF000000),
                      fontSize: 24.0
                    ),
                  ),
                  Text(
                    'YOUR EMAIL ADDRESS',
                    style: GoogleFonts.abel(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF000000),
                        fontSize: 24.0
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: SvgPicture.asset(
                'assets/images/emailConfirmation.svg',
                width: 280.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      widget.email ?? '',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF262626),
                      fontSize: 14.0
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                      'We’ve sent you a verification email, please check your inbox and follow the instructions to verify your account',
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
                  controller.checkEmailVerificationStatus();
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
            SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: (){
                controller.sendEmailVerification();
              },
              child: Center(
                child: Text(
                  'Resend email',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF262626),
                      fontSize: 14.0
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
