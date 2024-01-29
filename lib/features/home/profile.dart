import 'package:SL_Explorer/features/profile/changePassword.dart';
import 'package:SL_Explorer/features/profile/editprofile.dart';
import 'package:SL_Explorer/features/profile/forhelp.dart';
import 'package:SL_Explorer/features/profile/settings.dart';
import 'package:SL_Explorer/services/firebase_services/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}







class _ProfilePageState extends State<ProfilePage>{



  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
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
      DocumentSnapshot userSnapshot =
      await _firestore.collection('Users').doc(_user!.uid).get();

      if (userSnapshot.exists) {
        setState(() {
          _userData = userSnapshot.data() as Map<String, dynamic>;
        });
      } else {
        print('User document does not exist in Firestore.');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }








  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final deviceStorage = GetStorage();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.merriweather(
          ),
        ),
        backgroundColor: const Color.fromRGBO(253, 129, 3, 1.0),
        foregroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
        shadowColor: const Color.fromRGBO(0, 0, 0, 1.0),
        surfaceTintColor: const Color.fromRGBO(0, 0, 0, 1.0),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 25.0,
          letterSpacing: 1.0,
        ),
        centerTitle: true,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: _width,
              height: 120.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Color.fromRGBO(253, 129, 3, 1.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "assets/images/tempProfile.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  _userData != null
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${_userData!['firstName']}",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text("${_userData!['email']}",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text("Location, Germany",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      // Add other user details as needed
                    ],
                  )
                      : const CircularProgressIndicator(),
                ],
              )
          ),

          Center(
            child: Container(
              height: _height - 265.0,
              //color: Colors.red,
              padding: EdgeInsets.fromLTRB(_width/15,0,_width/15,0),
              child: ListView(

                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0,_height/12,0,0),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: (){
                        Get.to(() => const EditProfilePage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.edit,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "Edit Profile",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.arrow_right,
                            size: 30.0,
                            weight: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: (){
                        Get.to(() => const ChangePasswordPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.key,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "Change Password",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.arrow_right,
                            size: 30.0,
                            weight: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: (){
                        Get.to(() => ProfilePage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.credit_card,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "Payment Methods",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.arrow_right,
                            size: 30.0,
                            weight: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: (){
                        Get.to(() => const SettingsPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.settings,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "Settings",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.arrow_right,
                            size: 30.0,
                            weight: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(

                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: (){
                        Get.to(() => const ForHelpPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.headphones,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "For Help",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.arrow_right,
                            size: 30.0,
                            weight: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),







                  Container(
                    margin: EdgeInsets.fromLTRB(_width/8, 50,_width/8,20),
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
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          const Icon(
                            Icons.logout,
                            size: 24,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                            child: GestureDetector(
                              onTap: (){
                                AuthenticationRepository.instance.logOut();
                              },
                              child: Text(
                                "Log Out",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}