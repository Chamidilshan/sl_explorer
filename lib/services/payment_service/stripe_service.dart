import 'dart:convert';

import 'package:SL_Explorer/constants/constants.dart';
import 'package:http/http.dart' as http;

dynamic createPaymentIntent(String amount, String currency) async {
  try {
    //Request body
   final body = {
      'amount': amount,
      'currency': currency,
    };

    //Make post request to Stripe
    var response = await http.post(
      Uri.parse('$baseUrl/api/v1/payment/makePayment'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: body,
    );
    return jsonDecode(response.body);
  } catch (err) {
    throw Exception(err.toString());
  }
}