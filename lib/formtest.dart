import 'package:final_reg/features/authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  TextEditingController firstNameController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 253, 129, 3),
          title: Center(
            child: Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                    padding: const EdgeInsets.all(15.0),
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
                    padding: const EdgeInsets.all(15.0),
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
                    padding: const EdgeInsets.all(15.0),
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
                    padding: const EdgeInsets.all(15.0),
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 253, 129, 3),
                        ),
                        child: Text(
                          'Sign Up'.toUpperCase(),
                          style: TextStyle(fontSize: 15.0),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // _formKey.currentState!.save();
                            // print('First Name: $_firstName');
                            controller.signUp(
                                email: _email,
                                password: _password,
                                firstName: _firstName,
                                familyName: _familyName,
                              context: context
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      "or sign up with",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SocialButton(
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
