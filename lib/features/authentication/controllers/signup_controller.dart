import 'package:final_reg/common/snackbar.dart';
import 'package:final_reg/constants/utils/network_manager.dart';
import 'package:final_reg/features/authentication/screens/email_verification_screen.dart';
import 'package:final_reg/models/user_model.dart';
import 'package:final_reg/services/firebase_services/authentication_repository.dart';
import 'package:final_reg/services/firebase_services/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController{

  static SignUpController get instance => Get.find();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String familyName,
    required BuildContext context,
}) async{
    try{

      //show loading animations


      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        //stops animation
        return;
      }
      
     final userCredentials = await AuthenticationRepository.instance.registerWithEmailPassword(email, password);
      
      final newUser = UserModel(
          id: userCredentials.user!.uid,
          firstName: firstName,
          lastName: '',
          familyName: familyName,
          username: '',
          email: email,
          phoneNumber: '',
          password: password,
          profilePicture: ''
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUser(newUser);
      CommonLoaders.successSnackBar(title: 'Congratulations', duration: 4, message: 'Your account has been created');
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EmailVerificationScreen()));


    }catch(e){
      CommonLoaders.errorSnackBar(title: 'Wrong', message: e.toString(), duration: 4);
    }finally{

    }
  }


}