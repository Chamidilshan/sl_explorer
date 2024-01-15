import 'package:SL_Explorer/common/snackbar.dart';
import 'package:SL_Explorer/constants/utils/network_manager.dart';
import 'package:SL_Explorer/services/firebase_services/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInController extends GetxController{

  final localStorage = GetStorage();

  Future<void> emailAndPasswordSignIn({
    required String email,
    required String password
}) async{
    try{
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        return;
      }
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailPassword(email, password);
      AuthenticationRepository.instance.screenRedirect();
    }catch(e){
      CommonLoaders.errorSnackBar(title: 'Wrong', duration: 4, message: e.toString());
    }
  }

}