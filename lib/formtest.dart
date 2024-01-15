import 'package:SL_Explorer/features/authentication/controllers/signin_controller.dart';
import 'package:SL_Explorer/features/authentication/controllers/signup_controller.dart';
import 'package:SL_Explorer/features/authentication/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';

class FormTest extends StatefulWidget {
  @override
  _FormTestState createState() => _FormTestState();
}

class _FormTestState extends State<FormTest> {
  String _firstName = '';
  String _familyName = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool isLoading = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0,0.0,0.0,0.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'CREATE \nYOUR ACCOUNT',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.abel(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000),
                          fontSize: 36.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 0.0),
                  child: CustomWidgets.buildFirstNameField(
                    controller: firstNameController,
                    onChanged: (text) {
                      setState(() {
                        _firstName = text;
                      });
                    },
                    onSaved: (text) {
                      _firstName = text!;
                    },
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 0.0),
                  child: CustomWidgets.buildFamilyNameField(
                    controller: familyNameController,
                    onChanged: (text) {
                      setState(() {
                        _familyName = text;
                      });
                    },
                    onSaved: (text) {
                      _familyName = text!;
                    },
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 0.0),
                  child: CustomWidgets.buildEmailField(
                    controller: emailController,
                    onChanged: (text) {
                      setState(() {
                        _email = text;
                      });
                    },
                    onSaved: (text) {
                      _email = text!;
                    },
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 0.0),
                  child: CustomWidgets.buildPasswordField(
                    controller: passwordController,
                    onChanged: (text) {
                      setState(() {
                        _password = text;
                      });
                    },
                    onSaved: (text) {
                      _password = text!;
                    },
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 0.0),
                  child: CustomWidgets.buildConfirmPasswordField(
                    controller: confirmPasswordController,
                    passwordController: passwordController,
                    onChanged: (text) {
                      setState(() {
                        _confirmPassword = text;
                      });
                    },
                    onSaved: (text) {
                      _confirmPassword = text!;
                    },
                    validator: (confirmPassword) {
                      if (confirmPassword!.isEmpty) {
                        return 'required';
                      } else if (confirmPassword != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: MyButton(
                    btnText: 'SIGN UP',
                    onTap: () async{
                      if (_formKey.currentState!.validate()) {

                        _formKey.currentState!.save();
                        print('First Name: $_firstName');

                        showDialog(
                            context: context,
                            builder: (context){
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFFfd8103),
                                ),
                              );
                            }
                        );

                        await controller.signUp(
                            email: _email,
                            password: _password,
                            firstName: _firstName,
                            familyName: _familyName,
                            context: context
                        );

                        // Navigator.pop(context);
                      }
                    },
                  ),
                ),
                const SizedBox(height:25),
                Text(
                  "or sign up with",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontFamily: 'ABeeZee',
                  ),
                ),
                const SizedBox(height:30),
                SocialButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
