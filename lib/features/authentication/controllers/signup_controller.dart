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

  Future<void> signUp() async{
    try{

      
    }catch(e){

    }finally{

    }
  }


}