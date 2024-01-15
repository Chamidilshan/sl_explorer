import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonLoaders{

  static successSnackBar({
    required title,
    message = '',
    required duration
  }){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: EdgeInsets.all(10),
        icon: Icon(Icons.check, color: Colors.white,)
    );
  }

  static errorSnackBar({
    required title,
    message = '',
    required duration
  }){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: EdgeInsets.all(10),
        icon: Icon(Icons.check, color: Colors.white,)
    );
  }

  static warningSnackBar({
    required title,
    message = '',
    required duration
  }){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: EdgeInsets.all(10),
        icon: Icon(Icons.check, color: Colors.white,)
    );
  }

}