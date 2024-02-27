import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:SL_Explorer/features/payments/payment_screen.dart';
import 'package:flutter/material.dart';

class PaypalHomeScreen extends StatefulWidget {
  final String packageName;
  final DateTime date;
  final String adultCount;
  final String childCount;
  const PaypalHomeScreen({
    Key? key,
    required this.packageName,
    required this.date,
    required this.adultCount,
    required this.childCount
  }) : super(key: key);

  @override
  State<PaypalHomeScreen> createState() => _PaypalHomeScreenState();
}

class _PaypalHomeScreenState extends State<PaypalHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.packageName,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      size: 15,
                      color: Colors.grey,
                    ),
                    Text("    ${widget.adultCount}-Adults | ${widget.childCount}-Children",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.date_range,
                      size: 15,
                      color: Colors.grey,
                    ),
                    Text("    ${widget.date.year}-${widget.date.month}-${widget.date.day}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.black.withOpacity(0.45))
                  ),
                  padding: EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 4.0,
                      bottom: 4.0
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Have a promo code? Enter here',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.0,
                        child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.withOpacity(0.05),
                              side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)
                              )
                            ),
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Payment Method',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0
                  ),
                ),
              ],
            ),
          )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: 48.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: logoColor.withOpacity(0.75),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                )
            ),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Payment(
                    onFinish: (number) async {
                      // payment done
                      final snackBar = SnackBar(
                        content: const Text("Payment done Successfully"),
                        duration: const Duration(seconds: 5),
                        action: SnackBarAction(
                          label: 'Close',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                ),
              );
            },
            child: Text(
              'Pay Advance 20\$',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}