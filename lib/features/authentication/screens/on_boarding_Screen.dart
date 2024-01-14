import 'package:SL_Explorer/features/authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'First Screen'
              ),
              TextButton(
                  onPressed: (){
                    final storage = GetStorage();
                    storage.write('IsFirstTime', true);
                    Get.offAll(()=> const LoginScreen());
                  },
                  child: Text(
                    'Click Me To Next Screen'
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
