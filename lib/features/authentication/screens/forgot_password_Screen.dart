import 'package:SL_Explorer/features/authentication/controllers/forgot_password_controller.dart';
import 'package:SL_Explorer/features/authentication/widgets/my_button.dart';
import 'package:SL_Explorer/features/authentication/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final emailController = TextEditingController();
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height*0.05,
              ),
              Text(
                  'Forgot Password ?',
                style: GoogleFonts.poppins(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E232C),
                )
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                  'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8391A1),
                )
              ),
              MyTextField(
                controller: emailController,
                hintText: 'Enter Your Email Address',
                obscureText: false,
              ),
          SizedBox(
            height: 40.0,
          ),
          MyButton(
            btnText: 'SUBMIT',
            onTap: () async {
              if (emailController.text.isNotEmpty) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFfd8103),
                        ),
                      );
                    }
                );

                controller.sendPasswordResetEmail(emailController.text.toString());

                // Navigator.pop(context);
              };
            }
            )
            ],
          ),
        ),
      ),
    );
  }
}
