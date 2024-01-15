import 'package:SL_Explorer/features/authentication/controllers/signin_controller.dart';
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
  }) {
    return buildTextField(
      controller: controller,
      hintText: 'Password',
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      obscureText: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.visibility_off),
        onPressed: () {},
      ),
    );
  }

  static Widget buildConfirmPasswordField({
    required TextEditingController controller,
    required TextEditingController passwordController,
    required Function(String) onChanged,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
  }) {
    return buildTextField(
      controller: controller,
      hintText: 'Confirm Password',
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      obscureText: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.visibility_off),
        onPressed: () {},
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlutterSocialButton(
          onTap: () {},
          mini: true,
          buttonType: ButtonType.apple,
        ),
        FlutterSocialButton(
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
            // signInWithGoogle();
          },
          mini: true,
          buttonType: ButtonType.google,
        ),
        FlutterSocialButton(
          onTap: () {},
          mini: true,
          buttonType: ButtonType.facebook,
        ),
      ],
    );
  }
}
