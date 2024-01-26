import 'package:SL_Explorer/features/profile/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: GoogleFonts.merriweather(
          ),
        ),
        backgroundColor: const Color.fromRGBO(253, 129, 3, 1.0),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
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
          Center(
            child: Container(
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text("d.rieger@artisttwist.net",
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
                      ],
                    ),
                  ],
                )
            ),
          ),
          Container(
            height: _height - 200.0,
            //color: Colors.red,
            padding: EdgeInsets.fromLTRB(_width/15,0,_width/15,0),
            //padding: EdgeInsets.all(_width/15),
            child: ListView(
              padding: EdgeInsets.fromLTRB(0,20.0,0,0),
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        )
                    ),
                    //color: Colors.lightBlue
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.edit,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                              child: Text(
                                "Edit Profile",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_right,
                          size: 40.0,
                          weight: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        )
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.key,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                              child: Text(
                                "Change Password",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_right,
                          size: 40.0,
                          weight: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        )
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.credit_card,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                              child: Text(
                                "Payment Methods",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_right,
                          size: 40.0,
                          weight: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        )
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: (){
                      Get.to(SettingsPage());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.settings,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                              child: Text(
                                "Settings",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_right,
                          size: 40.0,
                          weight: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        )
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.headphones,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                              child: Text(
                                "For Help",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_right,
                          size: 40.0,
                          weight: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),







                Container(
                  margin: EdgeInsets.fromLTRB(_width/8,20,_width/8,20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromRGBO(253, 129, 3, 1.0),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
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
                          child: Text(
                            "Log Out",
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
          ),
        ],
      ),
    );
  }
}