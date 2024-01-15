import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 0.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText, // Set the default text
          hintStyle: const TextStyle(
            fontFamily: 'ABeeZee', // Set the font for the default text
            color: Colors.grey, // Set the color for the default text
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Set the bottom border color to black
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}