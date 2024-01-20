import 'package:SL_Explorer/features/authentication/controllers/signin_controller.dart';
import 'package:SL_Explorer/features/authentication/widgets/square_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';

import 'services/firebase_services/google_signin_service.dart';

class CustomWidgets {

  static Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required Function(String) onChanged,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      maxLines: 1,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
    );
  }

  static Widget buildFirstNameField({
    required TextEditingController controller,
    required Function(String) onChanged,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
  }) {
    return buildTextField(
      controller: controller,
      hintText: 'First name',
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
    );
  }

  static Widget buildFamilyNameField({
    required TextEditingController controller,
    required Function(String) onChanged,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
  }) {
    return buildTextField(
      controller: controller,
      hintText: 'Family name',
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
    );
  }

  static Widget buildEmailField({
    required TextEditingController controller,
    required Function(String) onChanged,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
  }) {
    return buildTextField(
      controller: controller,
      hintText: 'Email Address',
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      obscureText: false,
    );
  }

  static Widget buildPasswordField({
    required TextEditingController controller,
    required Function(String) onChanged,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
    bool obscureText=true,
    required VoidCallback toggleVisibility,
  }){



  return buildTextField(
    controller: controller,
    hintText: 'Password',
    onChanged: onChanged,
    onSaved: onSaved,
    validator: validator,
    obscureText:obscureText,
    suffixIcon: IconButton(
      icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
      onPressed: toggleVisibility,
    ),
  );
  }

  static Widget buildConfirmPasswordField({
    required TextEditingController controller,
    required TextEditingController passwordController,
    required Function(String) onChanged,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
    required bool obscureText,
    required VoidCallback toggleVisibility,
  }) {

    return buildTextField(
      controller: controller,
      hintText: 'Confirm Password',
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText,
      suffixIcon: IconButton(
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: toggleVisibility,

      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Apple Button
        const SquareTitle(
          imagePath: 'assets/images/apple-logo.png',
        ),
        const SizedBox(width: 20),
        //Google Button
        GestureDetector(
          child: const SquareTitle(
              imagePath: 'assets/images/search.png'
          ),
          onTap: () async{
            showDialog(
                context: context,
                builder: (context){
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFfd8103),
                    ),
                  );
                }
            );
            await controller.googleSignIn();
            // Navigator.pop(context);
          },
        ),
        const SizedBox(width: 20),
        //Facebook Button
        const SquareTitle(imagePath: 'assets/images/facebook.png'),

      ],
    );
  }
}
