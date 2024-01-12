import 'package:final_reg/firebase_options.dart';
import 'package:final_reg/formtest.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Sign up',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: FormTest(),
    );
  }
}
