import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/snackbar.dart';
import '../../constants/utils/network_manager.dart';

class ForHelpPage extends StatefulWidget {
  const ForHelpPage({super.key});

  @override
  State<ForHelpPage> createState() => _ForHelpPageState();
}

checkConnection() async{
  final isConnected = await NetworkManager.instance.isConnected();
  if(isConnected){
    return true;
  }
  else{
    return false;
  }
}

class _ForHelpPageState extends State<ForHelpPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    //final _height = MediaQuery.of(context).size.height;
    final isConnected = checkConnection();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "For Help",
          style: GoogleFonts.merriweather(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 25.0,
            letterSpacing: 1.0,
          ),
        ),
        //backgroundColor: const Color.fromRGBO(253, 129, 3, 1.0),
        foregroundColor: Colors.black,
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
                padding: EdgeInsets.fromLTRB(width/15,0,width/15,0),
                //padding: EdgeInsets.all(_width/15),
                margin: const EdgeInsets.fromLTRB(0, 30.0, 0, 20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: ()async {
                    var url = Uri.parse("mailto:info@srilanka-explorer.de");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      CommonLoaders.errorSnackBar(title: '', duration: 4, message: "Something went wrong");
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.mail,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                            child: Text(
                              "Mail Us",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //color: Colors.red,
                padding: EdgeInsets.fromLTRB(width/15,0,width/15,0),
                //padding: EdgeInsets.all(_width/15),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () async {
                    var url = Uri.parse("whatsapp://send?text=Hello%20Need%20Help!%20From%20App&phone=+94775569909");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      CommonLoaders.errorSnackBar(title: '', duration: 4, message: "Something went wrong");
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.perm_phone_msg,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                            child: Text(
                              "WhatsApp",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //color: Colors.red,
                padding: EdgeInsets.fromLTRB(width/15,0,width/15,0),
                //padding: EdgeInsets.all(_width/15),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.telegram,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                            child: Text(
                              "Telegram",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //color: Colors.red,
                padding: EdgeInsets.fromLTRB(width/15,0,width/15,0),
                //padding: EdgeInsets.all(_width/15),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () async {
                    var url = Uri.parse("https://www.srilanka-explorer.de/");
                    if(isConnected){
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else{
                        CommonLoaders.errorSnackBar(
                        title: 'Cannot launch, Try manually,',
                        duration: 4,
                        message: "https://www.srilanka-explorer.de/");
                      }
                    } else {
                        CommonLoaders.errorSnackBar(
                            title: 'No Internet Connection',
                            duration: 4,
                            message: "https://www.srilanka-explorer.de/");
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.public,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                            child: Text(
                              "Web Site",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
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