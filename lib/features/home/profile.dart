import 'package:SL_Explorer/features/profile/cart.dart';
import 'package:SL_Explorer/features/profile/changePassword.dart';
import 'package:SL_Explorer/features/profile/editprofile.dart';
import 'package:SL_Explorer/features/profile/forhelp.dart';
import 'package:SL_Explorer/features/profile/paymentMethods.dart';
import 'package:SL_Explorer/features/profile/settings.dart';
import 'package:SL_Explorer/features/profile/wishlist.dart';
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
      // appBar: AppBar(
      //   title: Text(
      //     "My Profile",
      //     style: GoogleFonts.merriweather(
      //     ),
      //   ),
      //   backgroundColor: const Color.fromRGBO(253, 129, 3, 1.0),
      //   foregroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
      //   shadowColor: const Color.fromRGBO(0, 0, 0, 1.0),
      //   surfaceTintColor: const Color.fromRGBO(0, 0, 0, 1.0),
      //   titleTextStyle: const TextStyle(
      //     fontWeight: FontWeight.w900,
      //     fontSize: 25.0,
      //     letterSpacing: 1.0,
      //   ),
      //   centerTitle: true,
      // ),
      body:  ListView(
        //hei
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              //width: _width,
              height: 190.0,
              padding: EdgeInsets.symmetric(
                vertical: 10
              ),
              color: Color.fromRGBO(253, 129, 3, 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _userData != null
                      ?
                  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child:
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              "${_userData!['profilePicture']}",
                            ),
                          ),
                        ),
                          Text("${_userData!['firstName']}  ${_userData!['lastName']}",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text("${_userData!['email']}",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          _userData!['country'] != null ?
                          Text("${_userData!['country']}",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                            )
                          )
                              :
                          const Text(
                              ""
                          )
                          ]
                      )
                      :
                  const CircularProgressIndicator(),
                ],
              )
          ),

          Center(
            child: Container(
              //height: _height/1.5,
              //color: Colors.red,
              // margin: EdgeInsets.all(25),
              padding: EdgeInsets.symmetric(
                horizontal: 25
              ),
              child: Column(
                children: [
                  Container(
                    //margin: EdgeInsets.all(25),
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
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
                                size: 20,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "Edit Profile",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   size: 25.0,
                          //   color: Colors.black,
                          //   weight: 30.0,
                          // ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    //margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
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
                                size: 20,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "Change Password",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   size: 25.0,
                          //   color: Colors.black,
                          //   weight: 30.0,
                          // ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    //margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: (){
                        Get.to(() => const WishlistPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                size: 20,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "Wishlist",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   size: 25.0,
                          //   color: Colors.black,
                          //   weight: 30.0,
                          // ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    //margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: (){
                        Get.to(() => const CartPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.shopping_cart,
                                size: 20,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "Cart",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   size: 25.0,
                          //   color: Colors.black,
                          //   weight: 30.0,
                          // ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    //margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: (){
                        Get.to(() => PaymentMethodsPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.credit_card,
                                size: 20,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "Payment Methods",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   size: 25.0,
                          //   color: Colors.black,
                          //   weight: 30.0,
                          // ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    //margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
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
                                size: 20,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "Settings",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   size: 25.0,
                          //   color: Colors.black,
                          //   weight: 30.0,
                          // ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    //margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
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
                                size: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                child: Text(
                                  "For Help",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   size: 25.0,
                          //   weight: 30.0,
                          //   color: Colors.black,
                          // ),
                        ],
                      ),
                    ),
                  ),







                  Container(
                    margin: EdgeInsets.fromLTRB(_width/8, 40,_width/8,20),
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
                            size: 18,
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
                                  fontSize: 16,
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