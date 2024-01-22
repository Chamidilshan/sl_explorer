import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'question_common.dart';
import 'question_country.dart';

class QGnder extends StatefulWidget {
  const QGnder({super.key});

  @override
  State<QGnder> createState() => _QGnderState();
}

class _QGnderState extends State<QGnder> {
  int numberOfPages = 2;
  int currentPage = 0;

  void handleImageTap(String gender) {
    //database

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QCountry()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 30.0, top: 20.0),
                  child: Text(
                    "SKIP",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'What is \nyour gender ?',
                style: GoogleFonts.abel(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000),
                  fontSize: 36.0,
                ),
              ),
            ),
            const SizedBox(height: 60.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderImage(
                  imagePath: 'assets/images/male.png',
                  label: 'Male',
                  onTapCallback: () => handleImageTap('Male'),
                ),
                const SizedBox(width: 16.0),
                GenderImage(
                  imagePath: 'assets/images/frmale.png',
                  label: 'Female',
                  onTapCallback: () => handleImageTap('Female'),
                ),
              ],
            ),
            const SizedBox(height: 150.0,),
            Common(
              numberOfPages: numberOfPages,
              currentPage: currentPage,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
                if (currentPage == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QCountry()),
                  );
                }
              },
            ),
            const SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}

class GenderImage extends StatelessWidget {
  final String imagePath;
  final String label;
  final Function() onTapCallback;

  const GenderImage({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 150.0,
      child: Material(
        // color: const Color(0xFFfd8103),
        elevation: 8,
        borderRadius: BorderRadius.circular(28),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onTapCallback,
                child: Image.asset(
                    imagePath
                )
            ),
            // Ink.image(
            //   image: AssetImage(imagePath),
            //   height: 150.0,
            //   width: 150.0,
            //   fit: BoxFit.cover,
            // ),
            const SizedBox(height: 8.0),
            Text(
              label,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
