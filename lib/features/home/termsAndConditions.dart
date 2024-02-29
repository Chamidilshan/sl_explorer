import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndCondotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms & Conditions",
          style: GoogleFonts.merriweather(
            //color: Colors.black,
          ),
        ),
        foregroundColor: Colors.white,
        shadowColor: const Color.fromRGBO(0, 0, 0, 1.0),
        surfaceTintColor: const Color.fromRGBO(0, 0, 0, 1.0),
        backgroundColor: const Color.fromRGBO(253, 129, 3, 1.0),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20.0,
          letterSpacing: 1.0,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: General Booking Information
            Text(
              'Your booking with SriLanka-Explorer - S.L. Explorer Pvt.Ltd.',
              style: GoogleFonts.merriweather(
                //color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              """
              All tourism products and services presented on our website, as well as our written travel offers, are only available to a limited extent. SriLanka-Explorer - S.L. Explorer Pvt. Ltd. does not guarantee the availability of any product, service or written offer at any time.
            The term "booking" refers to your written acceptance of our travel offer.
            The acceptance of SriLanka-Explorer - S.L. Explorer Pvt. Ltd. (and thus the conclusion of a contract) takes place when the service is available by sending a travel confirmation/invoice.
            Any discrepancies in the confirmation documents you receive following a booking are SriLanka-Explorer - S.L. Explorer Pvt. Ltd. without delay.
            SriLanka-ExpIorer - S.L. Explorer Pvt. Ltd. strongly recommends that you take out insurance for all tourism products and services, especially as circumstances may arise which lead to acute incapacity to travel (e.g. illness) and for which neither SriLanka-Explorer - S.L. Explorer Pvt. Ltd. nor the respective service provider are liable.
            All bookings are reserved for persons who have reached the age of 18. It is therefore not possible for persons under the age of 18 to book travel services and make use of them if the booking details indicate that they are traveling alone.""",
              style: GoogleFonts.poppins(
                //color: Colors.black,
                fontSize: 12,
              ),
            ),

            // Section 2: Notes for flight bookings
            SizedBox(height: 16.0),
            Text(
              'Notes for flight bookings',
              style: GoogleFonts.merriweather(
                //color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            Text("""
           Please note that all flights offered by SriLanka-Explorer - S.L. Explorer Pvt. Ltd. and fares published on behalf of the airlines are subject to special conditions. Thus, according to the airlines' fare conditions, flight tickets can often not be transferred to other persons or the fare cannot be refunded in the event of a cancellation. Airfares are current prices and the airlines' pricing is not under the control of SriLanka-Explorer - S.L. Explorer Pvt. Ltd. Therefore, prices may change at any time.
          Flight bookings can consist of several legs. According to the terms and conditions of most airlines, these must be used in order. If this is not the case, the airline may refuse onward carriage on the connecting flights booked.
          You may also be responsible under the respective airlines for complying with the airlines' or other providers' requirements with regard to check-in times, reconfirmation of return flights and other matters. Check-in for international flights should take place at least 120 minutes before departure, for domestic flights 90 minutes before departure. Some airlines require confirmation of your flight booking at least 72 hours before departure. If no such confirmation is given to the airline within this time, your booking may be canceled.
          SriLanka-Explorer - S.L. Explorer Pvt. Ltd. does not bear the costs for any transfer connections between airports or terminals.
            """,

              style: GoogleFonts.poppins(
                //color: Colors.black,
                fontSize: 12,
              ),
            ),

            // Section 3: E-tickets
            SizedBox(height: 16.0),
            Text(
              'E-tickets',
              style: GoogleFonts.merriweather(
                //color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              """
              Please note that airlines have different rules for issuing e-tickets SriLanka-Explorer - S.L. Explorer Pvt. Ltd. relies on the accuracy of the information provided by you. SriLanka-Explorer - S.L. Explorer Pvt. Ltd. is therefore not liable for failed access based on incorrect e-mail address details or any other reason for which you are responsible. You are therefore obliged to inform us immediately of any changes to your e-mail address or telephone number.
            as soon as you become aware of this. Please also ensure that the traveler's personal details provided at the time of booking correspond to the details on the passport.
            Please note that some providers require your booking number as proof of your booking.
              """,
              style: GoogleFonts.poppins(
              //color: Colors.black,
              fontSize: 12,
            ),
            ),

            // Section 4: Cancellation/Change
            SizedBox(height: 16.0),
            Text(
              'Cancellation/Change',
              style: GoogleFonts.merriweather(
                //color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            Text("""
            The possibility of canceling or changing the tourist products and services you have booked and the respective conditions depend on the terms and conditions of the respective service provider. Please note that with some service providers, it is not possible to cancel or change the tourist products and services you have booked, or only under certain conditions.
            Any changes to or cancelation of the booked tourist products and services must be made in writing.
            
Cancellation and rebooking fees for flights:
            The fares are special fares and cannot be canceled or rebooked.
            
Cancellation and rebooking fees for excursions (day tours and 2-day tours):
            The cancellation fee for our excursions is identical to the deposit (max. 25%) up to one day before the day of the excursion.
            Rebooking to another date is free of charge up to I week before the excursion date, after that a rebooking is treated as a cancellation.
            
Cancellation and rebooking fees for round trips, hotels, Ayurveda, group tours:
            Up to 42 days before departure 20%
            from the 41st to the 30th day before departure 25%
            from 29 to 22 days before departure 30%
            from 21 to 15 days before departure 40%
            from the 14th to the 7th day before departure 60%
            from 6th before departure 75%
            
Cancellation and rebooking fees for rental cars with driver program:
            The cancellation and rebooking fee for our rental car with driver program is identical to the deposit (max. 25%) up to one day before departure.
            """,
              style: GoogleFonts.poppins(
                //color: Colors.black,
                fontSize: 12,
              ),
            ),

            // Section 5: Payment
            SizedBox(height: 16.0),
            Text(
              'Payment',
              style: GoogleFonts.merriweather(
                //color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            Text("""
Flights and insurance services must be paid in full immediately upon receipt of the travel confirmation/invoice.
Payments for round trips, hotel bookings, Ayurveda treatments or rental cars are to be made in accordance with the specifications in your travel confirmation/invoice. The deposit (maximum 25%) is to be paid to our German account after receipt of the travel confirmation and the remaining amount either 10 days before arrival to our German account or in cash in €uro on arrival at to your driver or tour guide.
As long as no full payment has been made after receipt of the travel confirmation, there is no obligation to provide you with e-tickets, vouchers or other travel documents for approx. 1 week before arrival. However, the user remains obliged to pay the agreed amounts for the services ordered. Partial payments are not permitted.

No credit card payments can be accepted.
Refunds
Refunds are made in the same way as the previous payment, in each case to the person who previously made the payment.
            """,
              style: GoogleFonts.poppins(
                //color: Colors.black,
                fontSize: 12,
              ),
            ),

            // Section 6: Liability of SriLanka-Explorer - S.L. Explorer Pvt.Ltd.
            SizedBox(height: 16.0),
            Text(
              'Liability of SriLanka-Explorer - S.L. Explorer Pvt.Ltd.',
              style: GoogleFonts.merriweather(
                //color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            Text("""
            SriLanka-Explorer - S.L. Explorer Pvt. Ltd. endeavors to ensure that the information and other data available on the website and in our travel offers, in particular with regard to prices and dates, is current, complete and correct at the time of publication.
            All travel services presented on the website and in our travel offers are subject to limited availability.
            SriLanka-Explorer - S.L. Explorer Pvt. Ltd. is only liable in cases of intent or gross negligence, as well as for guarantees assumed and for the breach of essential contractual obligations.
            In the event of a slightly negligent breach of cardinal obligations, the liability of SriLanka-Explorer - S.L. Explorer Pvt. Ltd. is limited to foreseeable damages typical for this type of contract. SriLanka-Explorer - S.L. Explorer Pvt. Ltd. is not liable in these cases for indirect damages, consequential damages, loss of profit or loss of savings.
            """,
              style: GoogleFonts.poppins(
                //color: Colors.black,
                fontSize: 12,
              ),
            ),

            // Section 7: Passport, visa and health regulations
            SizedBox(height: 16.0),
            Text(
              'Passport, visa and health regulations',
              style: GoogleFonts.merriweather(
                //color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            Text("""
            The information on our website regarding passport, visa and health regulations is intended for travelers with German, Austrian or Swiss citizenship. If this does not apply to you, please contact the embassy responsible for you with regard to the relevant requirements. In principle, however, you yourself are responsible for complying with the applicable regulations. The information on these regulations is not part of the contractual obligation of SriLanka-Explorer - S.L. Explorer Pvt. Ltd.
            Current country and travel information can also be found on the websites of the Foreign Offices and on the websites of the Immigration Departments of Sri Lanka and the Maldives.
            """,
              style: GoogleFonts.poppins(
                //color: Colors.black,
                fontSize: 12,
              ),
            ),

            // Section 8: Place of jurisdiction
            SizedBox(height: 16.0),
            Text(
              'Place of jurisdiction',
              style: GoogleFonts.merriweather(
                //color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            Text("""
            Colombo, Sri Lanka
            """,
              style: GoogleFonts.poppins(
                //color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}