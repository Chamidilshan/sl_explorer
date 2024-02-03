import 'package:SL_Explorer/features/authentication/screens/forgot_password_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/snackbar.dart';
import '../../models/user_model.dart';
import '../../services/firebase_services/user_repository.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> updateKey = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  Map<String, dynamic>? _userData;

  String _password = '';
  String _newPassword = '';
  String _reTypedPassword = '';

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    //Firebase.initializeApp();
  }

  bool paswordsMatched(){
    if(_userData!['password'] == _password){
      //print(_password);
      if(_newPassword == _reTypedPassword){
        if(_newPassword.length >= 4){
          return true;
        }else {
          CommonLoaders.errorSnackBar(title: "Try Again", duration: 4, message: "Password should contain more than 4 characters");
        }
      }else {
        CommonLoaders.errorSnackBar(title: "Try Again", duration: 4, message: "Retyped password doesn't match");
      }
    }else {
      CommonLoaders.errorSnackBar(title: "Wrong Password", duration: 4, message: "Try forgot password, if you forgot");
    }
    return false;
  }

  Future<void> _getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });
      await _fetchUserData();
    }
  }

  Future<void> _fetchUserData() async {
    try {
      DocumentSnapshot userSnapshot = await _firestore.collection('Users').doc(_user!.uid).get();
      if (userSnapshot.exists) {
        setState(() {
          _userData = userSnapshot.data() as Map<String, dynamic>;
          isLoaded = true;
        });
      } else {
        print('User document does not exist in Firestore.');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }



  Future<void> _updateUserData() async {
    final newUser = UserModel(
      id: "${_userData!['id']}",
      firstName: "${_userData!['firstName']}",
      lastName: "${_userData!['lastName']}",
      familyName: "${_userData!['familyName']}",
      username: "${_userData!['username']}",
      email: "${_userData!['email']}",
      phoneNumber: "${_userData!['phoneNumber']}",
      password: _password,
      profilePicture: "${_userData!['profilePicture']}",
    );

    try {
      final userRepository = Get.put(UserRepository());
      await UserRepository.instance.updateUser(newUser);
      Get.back();
      CommonLoaders.successSnackBar(
          title: "Success",
          duration: 3,
          message: "Password changed successfully"
      );
      /*final FirebaseFirestore _db = FirebaseFirestore.instance;
      await _db.collection("Users").doc(newUser.id).update(newUser.toJson());
      //print(newUser.id);*/
    } on Exception catch (e) {
      print(e);
    }
  }





  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: GoogleFonts.merriweather(
            color: Colors.black,
          ),
        ),
        foregroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
        shadowColor: const Color.fromRGBO(0, 0, 0, 1.0),
        surfaceTintColor: const Color.fromRGBO(0, 0, 0, 1.0),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 22.0,
          letterSpacing: 1.0,
        ),
        centerTitle: true,
      ),
      body:
      isLoaded != false ?
      Form(
        key: updateKey,
        child: ListView(
          children: [
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                margin: const EdgeInsets.fromLTRB(30.0,40.0,30.0,20.0),
                //height: 60,
                //padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: _width/1.5,
                      padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,0.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null || value.isEmpty) {
                            return "Please enter your current password";
                          }else {
                            _password = value;
                            return null;
                          }
                        },
                        //initialValue: "${_userData!['firstName']}",
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Current Password",
                            contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 0,
                          ),
                        ),
                        obscureText: true,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0,0,10,0),
                      child: IconButton(
                          onPressed: (){},
                          icon: const Icon(
                            Icons.password,
                          )
                      ),
                    )
                  ],
                )
            ),

            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                margin: const EdgeInsets.fromLTRB(30.0,10.0,30.0,10.0),
                //height: 60,
                //padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: _width/1.5,
                      padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,0.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null || value.isEmpty) {
                            return "Please enter a new password";
                          }else {
                            _newPassword = value;
                            return null;
                          }
                        },
                        //initialValue: "${_userData!['lastName']}",
                        decoration: const InputDecoration(
                          //hintText: "dsdsdsd",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 0,
                            ),
                            labelText: "New Password"
                        ),
                        obscureText: true,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0,0,10,0),
                      child: IconButton(
                          onPressed: (){},
                          icon: const Icon(
                            Icons.password,
                          )
                      ),
                    )
                  ],
                )
            ),

            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                margin: const EdgeInsets.fromLTRB(30.0,10.0,30.0,10.0),

                //height: 60,
                //padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: _width/1.5,
                      padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,0.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null || value.isEmpty) {
                            return "Please retype your new password";
                          }else {
                            _reTypedPassword = value;
                            return null;
                          }
                        },
                        //initialValue: "${_userData!['familyName']}",
                        decoration: const InputDecoration(
                          //hintText: "dsdsdsd",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 0,
                          ),
                          labelText: "Retype password",
                        ),
                        obscureText: true,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0,0,10,0),
                      child: IconButton(
                          onPressed: (){},
                          icon: const Icon(
                            Icons.password,
                          )
                      ),
                    )
                  ],
                )
            ),







            Container(
              margin: EdgeInsets.fromLTRB(_width/5, 50,_width/5,0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Color.fromRGBO(253, 129, 3, 1.0),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onPressed: () async {
                  if(updateKey.currentState!.validate()){
                    if(paswordsMatched()){
                      _updateUserData();
                    }
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.save,
                      size: 24,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                      child: Text(
                        "Save",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            TextButton(
                onPressed: (){
                  Get.to(ForgotPasswordScreen());
                  },
                child: Text(
                    "Forgot Password?",
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
            ),
          ],
        ),
      ): const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );

  }
}
