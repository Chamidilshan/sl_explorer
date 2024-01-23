import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:SL_Explorer/question_country.dart';
import 'package:SL_Explorer/question_gender.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExtraQuestionsPage extends StatefulWidget {
  const ExtraQuestionsPage({super.key});

  @override
  State<ExtraQuestionsPage> createState() => _ExtraQuestionsPageState();
}

class _ExtraQuestionsPageState extends State<ExtraQuestionsPage> {
  final controller = PageController();

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        //padding: EdgeInsets.only(bottom: 80.0),
          child: PageView(
            controller: controller,
            children: [
              QGnder(),
              QCountry()
            ],
          )
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: (){},
                child: Text(
                    ''
                )
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: WormEffect(
                  activeDotColor: logoColor,
                ),
              ),
            ),
            TextButton(
                onPressed: (){},
                child: Text(
                  'Next'
                )
            )
          ],
        ),
      ),
    );
  }
}
