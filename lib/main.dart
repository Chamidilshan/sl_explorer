import 'package:SL_Explorer/bindings/general_binding.dart';
import 'package:SL_Explorer/features/authentication/screens/email_verification_screen.dart';
import 'package:SL_Explorer/features/authentication/screens/login_screen.dart';
import 'package:SL_Explorer/features/authentication/screens/success_verification_screen.dart';
import 'package:SL_Explorer/firebase_options.dart';
import 'package:SL_Explorer/formtest.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'services/firebase_services/authentication_repository.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value)=> Get.put(AuthenticationRepository())
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      initialBinding: GeneralBindings(),
      // builder: DevicePreview.appBuilder,
      title: 'Sign up',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Color(0xFFFD8103),
          ),
        ),
      ),
    );
  }
}
