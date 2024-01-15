import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final Function()? onTap;


  const MyButton({super.key,required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 180,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFfd8103),
            borderRadius: BorderRadius.circular(60),
          ),
          child: const Center(child: Text(
              "LOG IN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Abel',

            ),
          )),
        ),
      ),
    );

}
}
