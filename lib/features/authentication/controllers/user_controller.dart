import 'package:SL_Explorer/common/exceptions/firebase_exceptions.dart';
import 'package:SL_Explorer/common/exceptions/format_exceptions.dart';
import 'package:SL_Explorer/common/exceptions/platform_exceptions.dart';
import 'package:SL_Explorer/common/snackbar.dart';
import 'package:SL_Explorer/models/user_model.dart';
import 'package:SL_Explorer/services/firebase_services/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredential) async{
    try{
      if(userCredential!=null){
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: userCredential.user!.displayName![0] ?? '',
            lastName: '',
            familyName: '',
            username: userCredential.user!.displayName ?? '',
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            password: '',
            profilePicture: userCredential.user!.photoURL ?? ''
        );
        await userRepository.saveUser(user);
      }
    }catch(e){
      CommonLoaders.warningSnackBar(
          title: 'Data not saved',
          duration: 4,
        message: 'Something went wrong while saving your information.'
      );
    }
  }

}