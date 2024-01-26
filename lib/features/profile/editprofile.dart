import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {



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

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    //final _height = MediaQuery.of(context).size.height;
    final deviceStorage = GetStorage();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
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
      body:  Form(
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
                      child: Icon(Icons.edit)
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      TextFormField(
                        //initialValue: AutofillHints.familyName,
                        decoration: InputDecoration(
                          hintText: "dsdsdsd",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 0,
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      TextFormField(
                        //initialValue: AutofillHints.familyName,
                        decoration: InputDecoration(
                          hintText: "dsdsdsd",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 0,
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      TextFormField(
                        //initialValue: AutofillHints.familyName,
                        decoration: InputDecoration(
                          hintText: "dsdsdsd",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 0,
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      TextFormField(
                        //initialValue: AutofillHints.familyName,
                        decoration: InputDecoration(
                          hintText: "dsdsdsd",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 0,
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      TextFormField(
                        //initialValue: AutofillHints.familyName,
                        decoration: InputDecoration(
                          hintText: "dsdsdsd",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 0,
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}
