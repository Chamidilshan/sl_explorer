import 'package:flutter/material.dart';
class gallery extends StatefulWidget {
  const gallery({super.key});

  @override
  State<gallery> createState() => _galleryState();
}

class _galleryState extends State<gallery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('gallery page'),
    );
  }
}