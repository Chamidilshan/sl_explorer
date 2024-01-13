
import 'package:SL_Explorer/common/exceptions/firebase_auth_exceptions.dart';
import 'package:SL_Explorer/common/exceptions/firebase_exceptions.dart';
import 'package:SL_Explorer/common/exceptions/format_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../common/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{

  static AuthenticationRepository get instance => Get.find();

  // final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

@override
void onReady(){

}


//login



//signUp


Future<UserCredential> registerWithEmailPassword(String email, String password) async{
   try{
     return await _auth.createUserWithEmailAndPassword(email: email, password: password);
   } on FirebaseAuthException catch(e){
     throw CustomFirebaseAuthException(e.code).message;
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

Future<void> sendEmailVerification() async{
  try{
    return await _auth.currentUser?.sendEmailVerification();
  } on FirebaseAuthException catch(e){
    throw CustomFirebaseAuthException(e.code).message;
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

}