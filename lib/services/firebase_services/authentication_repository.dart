
import 'package:SL_Explorer/common/exceptions/firebase_auth_exceptions.dart';
import 'package:SL_Explorer/common/exceptions/firebase_exceptions.dart';
import 'package:SL_Explorer/common/exceptions/format_exceptions.dart';
import 'package:SL_Explorer/features/home/profile.dart';
import 'package:SL_Explorer/features/authentication/screens/email_verification_screen.dart';
import 'package:SL_Explorer/features/authentication/screens/login_page.dart';
import 'package:SL_Explorer/features/authentication/screens/on_boarding_Screen.dart';
import 'package:SL_Explorer/features/home/home_page.dart';
import 'package:SL_Explorer/features/Welcome/Welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:SL_Explorer/features/home/bottom_navigation.dart';

import '../../common/exceptions/platform_exceptions.dart';


class AuthenticationRepository extends GetxController{

  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

@override
void onReady(){
  screenRedirect();
}

screenRedirect() async {

  final user = _auth.currentUser;

  if(user!=null){
    if(user.emailVerified){
      Get.offAll(()=> const bottomNavigationBar());
    }else{
      Get.offAll(()=>const EmailVerificationScreen());
    }
  }
  else{
    deviceStorage.writeIfNull('IsFirstTime', true);

    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() =>  LoginPage())
        : Get.offAll(const WelcomePage());
  }
}

//login
Future<UserCredential?> loginWithEmailPassword(String email, String password) async{
 try{
   return await _auth.signInWithEmailAndPassword(email: email, password: password);
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


//signUp


Future<UserCredential?> registerWithEmailPassword(String email, String password) async{
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

  Future<UserCredential?> signInWithGoogle() async{
    try{
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      return await _auth.signInWithCredential(credential);

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

  Future<void> sendResetEmailVerification(String email) async{
    try{
     await _auth.sendPasswordResetEmail(email: email);
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


  Future<void> logOut() async{
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=>  LoginPage());
    }on FirebaseAuthException catch(e){
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