import 'package:flutter/material.dart';

class SuccessVerificationScreen extends StatefulWidget {
  const SuccessVerificationScreen({super.key});

  @override
  State<SuccessVerificationScreen> createState() => _SuccessVerificationScreenState();
}

class _SuccessVerificationScreenState extends State<SuccessVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Success'
        ),
      ),
    );
  }
}
