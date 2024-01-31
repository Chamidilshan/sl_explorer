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
    'https://images.pexels.com/photos/139398/thermometer-headache-pain-pills-139398.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://img.freepik.com/premium-photo/photo-closeup-shot-delicious-food_829042-89.jpg',
    'https://media.istockphoto.com/id/1286682876/photo/beauty-treatment-items-for-spa-procedures-on-white-wooden-table-massage-stones-essential-oils.jpg?s=612x612&w=0&k=20&c=Q6ENnCDbjQxkggfSLZq4WleuY0_IrMZ9MxMXRfNcsl8=',
    'https://media.istockphoto.com/id/454937447/photo/woman-having-a-back-oil-massage.jpg?s=612x612&w=0&k=20&c=2UE1r2pNewwMDYz9uivm6-FEzFKh2RDwuoO8FV55GYY=',
    'https://thumbs.dreamstime.com/b/concert-crowd-confetti-dancing-lights-nice-colors-picture-people-nightclub-94901606.jpg',
    'https://wallpapercosmos.com/w/full/a/c/6/1110620-3840x2160-desktop-4k-surfing-wallpaper-image.jpg',
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          imageUrls[index],
                          height: 80.0,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      Flexible(
                        flex: 2,
                        child: Column(
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
                        ),
                      )
                    ]),
              ),
            )
        );
      },
    );
  }
}

