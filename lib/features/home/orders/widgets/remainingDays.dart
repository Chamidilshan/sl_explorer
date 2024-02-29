import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RemainingDaysWidget extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;

  RemainingDaysWidget({required this.startDate, required this.endDate});

  @override
  _RemainingDaysWidgetState createState() => _RemainingDaysWidgetState();
}

class _RemainingDaysWidgetState extends State<RemainingDaysWidget> {
  late double percentage;
  late int remainingDays;

  @override
  void initState() {
    super.initState();
    updateRemainingTime();
  }

  void updateRemainingTime() {
    DateTime now = DateTime.now();
    if (now.isBefore(widget.endDate)) {
      remainingDays = widget.endDate.difference(now).inDays;
      //print(remainingDuration.inDays);
      percentage = (remainingDays / widget.endDate.difference(widget.startDate).inDays);
      //print(_percentage);
    }else{
      percentage = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height: 200,
            width: 200,
            child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: 10.0,
              //minHeight: 30,
              //borderRadius: BorderRadius.circular(10),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              backgroundColor: Colors.grey[300],
              semanticsLabel: 'Remaining Days',
              //semanticsValue: '${remainingDuration.inDays} days remaining',
            ),
          ),
          SizedBox(
            //padding: EdgeInsets.all(15),
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (percentage>0) ?
                Text(
                  "Your trip\nstarts in,\n${remainingDays} Days",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                ):
                Text(
                  "Thank you \nfor touring \nwith us.",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
