import 'package:SL_Explorer/features/authentication/controllers/signin_controller.dart';
import 'package:SL_Explorer/features/authentication/screens/forgot_password_Screen.dart';
import 'package:SL_Explorer/features/authentication/widgets/my_button.dart';
import 'package:SL_Explorer/features/authentication/widgets/my_textfield.dart';
import 'package:SL_Explorer/formtest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/square_title.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;  // Add a validator function

  MyTextField({
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validator,  // Add validator as an optional parameter
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText && _obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.obscureText
              ? IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
        ),
        validator: widget.validator,  // Set the validator function
      ),
    );
  }
}


class LoginPage extends StatelessWidget{
  LoginPage({super.key});

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  @override
  Widget build(BuildContext context){
    final controller = Get.put(SignInController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  <Widget>[

              const SizedBox(height: 50),

            //welcome back. you've been missed!

              Padding(
                padding: EdgeInsets.fromLTRB(25.0,0.0,0.0,0.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'LOG INTO\nYOUR ACCOUNT',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.abel(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF000000),
                        fontSize: 36.0
                    ),
                  ),
                ),
              ),
            const SizedBox(height:40),

            //Email textfield
              MyTextField(
                  controller: emailController,
                  hintText: 'Email Address',
                  obscureText: false,

                validator: (email) {
                  if (email!.isEmpty) {
                    return 'required';
                  } else if (!RegExp(
                      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*(\.[a-zA-Z]{2,})$')
                      .hasMatch(email)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },

              ),
              const SizedBox(height:20.0),
            //Password TextField
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,

              ),

              const SizedBox(height:20),

            //forgot password?
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(
                            ForgotPasswordScreen()
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'ABeeZee',
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              const SizedBox(height:40.0),

            //Log in button
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: MyButton(
                  btnText: 'LOG IN',
                  onTap: () async{
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
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

                      await controller.emailAndPasswordSignIn(
                          email: emailController.text,
                          password: passwordController.text
                      );

                     // Navigator.pop(context);

                    }


                  },
                ),
              ),

              const SizedBox(height:25),
              //or login with


                    Center(
                        child: Text(
                              'or log in with',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'ABeeZee',
                            ),
                          ),
                    ),

              const SizedBox(height:30),


            //google+ apple sign in buttons
              Row(
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
              ),

              const SizedBox(height:25),


            //not a member? register now
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      'Not a member?',
                    style: TextStyle(
                      fontFamily: 'ABeeZee',
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: (){
                      Get.to(
                          FormTest()
                      );
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        fontFamily: 'ABeeZee',
                        color: Color(0xFFfd8103),
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                ],
              )


          ],
          ),
        ),
      ),

    );

  }
}