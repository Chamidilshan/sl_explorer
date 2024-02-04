import 'package:SL_Explorer/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.merriweather(
            //color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
            letterSpacing: 1.0,
          ),
        ),
        //backgroundColor: const Color.fromRGBO(253, 129, 3, 1.0),
        //foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //color: Colors.red,
                padding: EdgeInsets.fromLTRB(_width/15,0,_width/15,0),
                //padding: EdgeInsets.all(_width/15),
                margin: EdgeInsets.fromLTRB(0, 30.0, 0, 20.0),
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
                            Icons.language,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                            child: Text(
                              "Switch Language",
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
                //color: Colors.red,
                padding: EdgeInsets.fromLTRB(_width/15,0,_width/15,0),
                //padding: EdgeInsets.all(_width/15),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: (){
                    //MyApp.changeMode();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.dark_mode,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                            child: Text(
                              "Switch Mode",
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
                //color: Colors.red,
                padding: EdgeInsets.fromLTRB(_width/15,0,_width/15,0),
                //padding: EdgeInsets.all(_width/15),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed:  ()async {
                      var url = Uri.parse("https://www.freeprivacypolicy.com/live/52b8458f-24dd-4592-9cb7-4726fa323ce9");
                      await launchUrl(url);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.description,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                            child: Text(
                              "Terms & Conditions",
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
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(_width/8,20,_width/8,0),
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          const Icon(
                            Icons.delete_forever,
                            size: 24,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                            child: Text(
                              "Delete Account",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Version 1.0.2",
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}