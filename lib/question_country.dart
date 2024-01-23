import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:csc_picker/csc_picker.dart';
import 'question_gender.dart';
import 'question_common.dart';

class QCountry extends StatefulWidget {
  const QCountry({Key? key}) : super(key: key);

  @override
  State<QCountry> createState() => _QCountryState();
}

class _QCountryState extends State<QCountry> {
  int numberOfPages = 2;
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _backbutton(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "SKIP",
                        style:  TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  'Where are \nyou from ?',
                  style: GoogleFonts.abel(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000),
                    fontSize: 36.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: Card(
                  // color: const Color(0xFFfd8103),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CSCPicker(
                      layout: Layout.vertical,
                      onCountryChanged: (country) {},
                      onStateChanged: (state) {},
                      onCityChanged: (city) {},
                      countryDropdownLabel: 'Select Country',
                      stateDropdownLabel: 'Select State',
                      cityDropdownLabel: 'Select City',
                      dropdownDialogRadius: 30.0,
                      searchBarRadius: 30.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 45.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFfd8103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.abel(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Common(
                numberOfPages: numberOfPages,
                currentPage: currentPage,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                  if (currentPage == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QGnder()),
                    );
                  }
                },
              ),
              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
}

class _backbutton extends StatelessWidget {
  const _backbutton({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.black,
        borderRadius: BorderRadius.circular(28),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          splashColor: Colors.black12,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QGnder()),
            );
          },
          child: Ink.image(
            image: AssetImage('assets/images/images.png'),
            height: 32.0,
            width: 32.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
