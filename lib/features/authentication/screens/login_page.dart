import 'package:flutter/material.dart';
import 'package:tourisma_pp/components/my_button.dart';
import 'package:tourisma_pp/components/my_textfield.dart';
import 'package:tourisma_pp/components/square_title.dart';
class LoginPage extends StatelessWidget{
  LoginPage({super.key});

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void  signUserIn(){}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  <Widget>[

              const SizedBox(height: 50),

            //welcome back. you've been missed!

              const Padding(
                padding: EdgeInsets.fromLTRB(25.0,0.0,0.0,0.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Log Into\nYour Account ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Abel',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            const SizedBox(height:10),

            //Email textfield
              MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
              ),
            //Password TextField
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height:20),

            //forgot password?
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'forgot password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ABeeZee',
                      ),
                    ),
                  ],
                ),
              ),


              const SizedBox(height:25),

            //Log in button
              MyButton(
                onTap: signUserIn,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Apple Button
                  SquareTitle(imagePath: 'lib/Images/apple-logo.png'),
                  SizedBox(width: 20),
                  //Google Button
                  SquareTitle(imagePath: 'lib/Images/search.png'),
                  SizedBox(width: 20),
                  //Facebook Button
                  SquareTitle(imagePath: 'lib/Images/facebook.png'),

                ],
              ),

              const SizedBox(height:25),


            //not a member? register now
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Not a member?',
                    style: TextStyle(
                      fontFamily: 'ABeeZee',
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Register now',
                    style: TextStyle(
                      fontFamily: 'ABeeZee',
                      color: Color(0xFFfd8103),
                      fontWeight: FontWeight.bold,


                    )
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