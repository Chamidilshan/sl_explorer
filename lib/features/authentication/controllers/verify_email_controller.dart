import 'dart:async';

import 'package:SL_Explorer/common/snackbar.dart';
import 'package:SL_Explorer/features/authentication/screens/login_screen.dart';
import 'package:SL_Explorer/features/authentication/screens/success_verification_screen.dart';
import 'package:SL_Explorer/services/firebase_services/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{

  static VerifyEmailController get instance => Get.find();

  @override
  void onInit(){
    sendEmailVerification();
    setTimer();//for auto redirect
    super.onInit();
  }

sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      CommonLoaders.successSnackBar(title: 'Email sent', duration: 4, message: 'Please check your inbox and verify your email address');
    } catch(e){
      CommonLoaders.errorSnackBar(title: '', duration: 4, message: e.toString());
    }
}

setTimer(){
    Timer.periodic(const Duration(seconds: 1), (timer) async{
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(()=> SuccessVerificationScreen(
          onPressed: () {
            AuthenticationRepository.instance.screenRedirect();
            },
        )
        );
      }
    });
}

checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
              ()=> SuccessVerificationScreen(
                onPressed: () {
                  AuthenticationRepository.instance.screenRedirect();
                },
              )
      );
    }
}


}