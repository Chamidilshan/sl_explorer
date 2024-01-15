import 'package:flutter/material.dart';

class SquareTitle extends StatelessWidget{
  final String imagePath;
  const SquareTitle({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 1.0, // Adjust the width of the border as needed
        ),
      ),
      child: Image.asset(
          imagePath,
        height: 30,
      ),
    );
  }
}
