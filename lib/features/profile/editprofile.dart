import 'package:SL_Explorer/common/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SL_Explorer/services/firebase_services/user_repository.dart';

import '../../models/user_model.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final GlobalKey<FormState> updateKey = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  Map<String, dynamic>? _userData;

  String? _firstName = '';
  String? _lastName = '';
  String? _familyName = '';
  String? _email = '';
  String? _profile = '';
  String? _mobile = '';
  String? _userName = '';
  bool? _countrySelected = null;
  bool? _stateSelected = null;
  bool? _citySelected = null;
  String? _city;
  String? _state;
  String? _country;

  bool isLoaded = false;

  //validating location details
  Future<bool?> validatelocation() async {
    if(_country != null && _country != ''){//anything else required?
      print(_country);
      return true;
    }
    CommonLoaders.errorSnackBar(title: "Country cannot be empty", duration: 3, message: "select your country");
    return null;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    //Firebase.initializeApp();
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
          _country = "${_userData!['country']}" == '' ? null : "${_userData!['country']}";
          _state = "${_userData!['state']}" == '' ? null : "${_userData!['state']}";
          _city = "${_userData!['city']}" == '' ? null : "${_userData!['city']}";
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
        firstName: _firstName ?? '',
        lastName: _lastName ?? '',
        familyName: _familyName ?? '',
        username: "${_userData!['username']}",
        email: _email ?? '',
        phoneNumber: _mobile ?? '',
        password: "${_userData!['password']}",
        profilePicture: "${_userData!['profilePicture']}",
        country: _country == "null" ? '' : _country,
        state: _state == "null" ? '' : _state,
        city: _city == "null" ? '' : _city,
    );

    try {
      final userRepository1 = Get.put(UserRepository());
      await UserRepository.instance.updateUser(newUser);
      Get.back();
      CommonLoaders.successSnackBar(
          title: "Details Updated",
          duration: 3,
          message: "Details updated successfully"
      );
    } on Exception catch (e) {
      print(e);
    }
  }






  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    //final _height = MediaQuery.of(context).size.height;
    final deviceStorage = GetStorage();


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
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
            Padding(
              padding: EdgeInsets.fromLTRB(_width/4,20,_width/4,0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      "assets/images/tempProfile.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    height: _width/2,
                    width: _width/2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            onPressed: (){},//editImage
                            child: const Icon(
                                Icons.edit,
                              size: 35,
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                margin: const EdgeInsets.fromLTRB(30.0,40.0,30.0,10.0),
                //height: 60,
                //padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,0.0),
                  child: TextFormField(
                    validator: (value){
                      if (value==null || value.isEmpty) {
                        return "Please enter your First Name";
                      }else {
                        _firstName = value;
                        return null;
                      }
                    },
                    initialValue: "${_userData!['firstName']}",
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      labelText: "First Name"
                    ),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,0.0),
                  child: TextFormField(
                    validator: (value){
                      if (value==null || value.isEmpty) {
                        return "Please enter your Last name";
                      }else {
                        _lastName = value;
                        return null;
                      }
                    },
                    initialValue: "${_userData!['lastName']}",
                    decoration: const InputDecoration(
                      //hintText: "dsdsdsd",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      labelText: "Last Name"
                    ),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,0.0),
                  child: TextFormField(
                    validator: (value){
                      if (value==null || value.isEmpty) {
                        return "Please enter your Family Name";
                      }else {
                        _familyName = value;
                        return null;
                      }
                    },
                    initialValue: "${_userData!['familyName']}",
                    decoration: const InputDecoration(
                      //hintText: "dsdsdsd",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      labelText: "Family Name",
                    ),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,0.0),
                  child: TextFormField(
                    validator: (value){
                      if (value==null || value.isEmpty) {
                        return "Please enter a valid E-mail address";
                      }else {
                        _email = value;
                        return null;
                      }
                    },
                    initialValue: "${_userData!['email']}",
                    decoration: const InputDecoration(
                      //hintText: "dsdsdsd",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      labelText: "E-mail Address",
                    ),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,0.0),
                  child: TextFormField(
                    validator: (value){
                      if (value==null || value.isEmpty) {
                        return "Please enter a valid mobile number";
                      }else {
                        _mobile = value;
                        return null;
                      }
                    },
                    initialValue: "${_userData!['phoneNumber']}",
                    decoration: const InputDecoration(
                      //hintText: "dsdsdsd",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      labelText: "Mobile Number",
                    ),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                )
            ),


            Container(
                margin: const EdgeInsets.fromLTRB(30.0,10.0,30.0,10.0),
                child: CSCPicker(
                  currentCountry: _country,
                  currentState: _state,
                  currentCity: _city,
                  countryFilter: const [
                    CscCountry.Germany,
                    CscCountry.Sri_Lanka,
                    CscCountry.United_Kingdom
                  ],
                  selectedItemStyle: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  ),
                  layout: Layout.vertical,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[100],
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0,
                    )
                  ),
                  disabledDropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[400],
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0,
                    )
                  ),
                  //flagState: CountryFlag.DISABLE,
                  onCountryChanged: (country) {
                        _country = country.toString();
                        _countrySelected = true;
                  }, //currentCountry
                  onStateChanged: (state) {
                    _state = state.toString();
                    _stateSelected = true;
                  },
                  onCityChanged: (city) {
                    _city = city.toString();
                    _citySelected = true;
                  },
                  countryDropdownLabel: 'Select Country',
                  stateDropdownLabel: 'Select State',
                  cityDropdownLabel: 'Select City',
                  dropdownDialogRadius: 20.0,
                  searchBarRadius: 30.0,
                )
            ),





            Container(
              margin: EdgeInsets.fromLTRB(_width/5, 50,_width/5,20),
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
                    if(await validatelocation() == true){
                      _updateUserData();
                      print("Form Submitted");
                    }
                    else{
                      print("enter country");
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
                        "Update",
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
