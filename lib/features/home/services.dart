import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SL_Explorer/features/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SL_Explorer/constants/utils/styles.dart';

class services extends StatefulWidget {
  @override
  _servicesState createState() => _servicesState();
}

class _servicesState extends State<services> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(HomePage());
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: _height * 0.005,
          horizontal: _width * 0.04,
        ),
        child: CardList(),
      ),
    );
  }
}

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<String> titles = [
    'Medical Services',
    'Restaurants',
    'Spa',
    'Ayurveda Spa',
    'Clubs',
    'Surfing Water Sport places'
  ];
  List<String> imageUrls = [
    'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/services_images%2Fphoto-1414235077428-338989a2e8c0.avif?alt=media&token=a8ae5c2c-c741-4167-af64-985ddb605522',
    'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/services_images%2Fphoto-1414235077428-338989a2e8c0.avif?alt=media&token=a8ae5c2c-c741-4167-af64-985ddb605522',
    'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/services_images%2Fphoto-1414235077428-338989a2e8c0.avif?alt=media&token=a8ae5c2c-c741-4167-af64-985ddb605522',
    'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/services_images%2Fphoto-1414235077428-338989a2e8c0.avif?alt=media&token=a8ae5c2c-c741-4167-af64-985ddb605522',
    'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/services_images%2Fphoto-1414235077428-338989a2e8c0.avif?alt=media&token=a8ae5c2c-c741-4167-af64-985ddb605522',
    'https://firebasestorage.googleapis.com/v0/b/sl-explorer.appspot.com/o/services_images%2Fphoto-1414235077428-338989a2e8c0.avif?alt=media&token=a8ae5c2c-c741-4167-af64-985ddb605522',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
            color: Colors.white,
            child: ExpansionTile(
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              trailing: IconButton(
                icon: Icon(Icons.keyboard_double_arrow_right_rounded),
                onPressed: () {},
              ),
              collapsedIconColor: logoColor,
              title: SizedBox(
                height: 80.0,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          )),
                      const SizedBox(width: 10.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titles[index],
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          ),
                        ],
                      )
                    ]),
              ),
            ));
      },
    );
  }
}
