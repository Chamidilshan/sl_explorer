import 'package:SL_Explorer/common/snackbar.dart';
import 'package:SL_Explorer/constants/utils/network_manager.dart';
import 'package:SL_Explorer/features/authentication/screens/reset_password_verification_Screen.dart';
import 'package:SL_Explorer/services/firebase_services/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{

  static ForgotPasswordController get instance => Get.find();

  GlobalKey<FormState> forgetPasswordFoemKey = GlobalKey<FormState>();

  sendPasswordResetEmail(String email) async{
    try{

      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        return;
      }
      print('sent email');

      await AuthenticationRepository.instance.sendResetEmailVerification(
          email.trim()
      );
      
      CommonLoaders.successSnackBar(
          title: 'Email sent',
          duration: 4,
          message: 'Email Link Sent To Reset Your Password. Check Your Inbox'.tr
      );
      
      Get.to(ResetPasswordVerificationScreen());

    }catch(e){
      CommonLoaders.errorSnackBar(title: 'Oh', duration: 4, message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try{

      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        return;
      }

      await AuthenticationRepository.instance.sendResetEmailVerification(
          email
      );

      CommonLoaders.successSnackBar(
          title: 'Email sent',
          duration: 4,
          message: 'Email Link Sent To Reset Your Password. Check Your Inbox'.tr
      );


    }catch(e){
      CommonLoaders.errorSnackBar(title: 'Oh', duration: 4, message: e.toString());
    }
  }


}