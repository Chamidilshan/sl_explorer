import 'package:SL_Explorer/common/exceptions/firebase_exceptions.dart';
import 'package:SL_Explorer/common/exceptions/format_exceptions.dart';
import 'package:SL_Explorer/common/exceptions/platform_exceptions.dart';
import 'package:SL_Explorer/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUser(UserModel user) async{
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch(e){
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch(e) {
      throw CustomFormatException();
    } on PlatformException catch(e) {
      throw CustomPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }



  Future<bool?> updateUser(UserModel user) async{
    try{
      await _db.collection("Users").doc(user.id).update(user.toJson());
      //await _db.collection("Users").doc(user.id).set(user.toJson(), SetOptions(merge: true));
      print(user.toJson());
      return true;
    } on FirebaseException catch(e){
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch(e) {
      throw const CustomFormatException();
    } on PlatformException catch(e) {
      throw CustomPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

}