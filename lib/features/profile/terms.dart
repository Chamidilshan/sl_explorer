import 'package:flutter/material.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Terms and Conditions',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '1. Acceptance of Terms\n'
                'By accessing or using this mobile application ("the App") and its associated services, you agree to comply with and be bound by the following terms and conditions. If you do not agree to these terms, please refrain from using the App.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '2. Scope of Services\n'
                'The App provides a platform connecting tourists, local guides, drivers, and hotels ("Service Providers") for travel-related services. Users must acknowledge that the App acts as an intermediary and does not assume responsibility for the services provided by third-party Service Providers.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '3. User Registration\n'
                'To access certain features of the App, users may be required to register and create an account. Users agree to provide accurate and up-to-date information during the registration process and to maintain the security of their account credentials.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '4. Booking and Payments\n'
                'Users can book travel-related services through the App. Payment details, including fees, refund policies, and payment methods, are outlined in the app during the booking process. Users are responsible for understanding and adhering to these payment terms.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '5. Cancellation and Refunds\n'
                'Cancellation policies for bookings made through the App are outlined by individual Service Providers. Users are responsible for reviewing and understanding the cancellation and refund policies associated with their bookings.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '6. User Conduct\n'
                'Users agree to use the App in compliance with applicable laws and regulations. Any inappropriate, unlawful, or harmful conduct may result in the termination of the user\'s account.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '7. Feedback and Ratings\n'
                'Users may provide feedback and ratings for Service Providers post-tour. The App reserves the right to moderate and manage user-generated content.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '8. Intellectual Property\n'
                'All intellectual property rights associated with the App, including logos, trademarks, and content, are owned by the App\'s developers. Users may not use, reproduce, or distribute any content from the App without prior written consent.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '9. Privacy Policy\n'
                'User data is handled in accordance with the App\'s Privacy Policy, accessible within the App. By using the App, users consent to the collection and use of their personal information as outlined in the Privacy Policy.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '10. Limitation of Liability\n'
                'The App is not liable for any direct, indirect, incidental, consequential, or punitive damages arising from the use of the App or the services provided by Service Providers.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '11. Termination of Services\n'
                'The App reserves the right to terminate or suspend services to any user without notice for violations of these terms and conditions.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '12. Governing Law\n'
                'These terms and conditions are governed by and construed in accordance with the laws of [Your Country], without regard to its conflict of law principles.',
          ),
          SizedBox(height: 10.0),
          Text(
            textAlign: TextAlign.justify,
            '13. Changes to Terms\n'
                'The App reserves the right to modify these terms and conditions at any time. Users are responsible for reviewing the terms regularly. Continued use of the App after modifications constitutes acceptance of the updated terms.',
          ),
        ],
      ),
    );
  }
}

/*void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: TermsAndConditionsWidget(),
    ),
  ));
}*/
