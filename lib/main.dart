import 'package:SL_Explorer/bindings/general_binding.dart';
import 'package:SL_Explorer/common/snackbar.dart';
import 'package:SL_Explorer/features/authentication/screens/email_verification_screen.dart';
import 'package:SL_Explorer/features/authentication/screens/success_verification_screen.dart';
import 'package:SL_Explorer/firebase_options.dart';
import 'package:SL_Explorer/formtest.dart';
import 'package:SL_Explorer/services/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'services/firebase_services/authentication_repository.dart';

Brightness mode = Brightness.light;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value)=> Get.put(AuthenticationRepository())
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<ThemeProvider>(context).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      initialBinding: GeneralBindings(),
      // builder: DevicePreview.appBuilder,
      title: 'Sign up',
      home: const Scaffold(
        body:
        Center(
          child: CircularProgressIndicator(
            color: Color(0xFFFD8103),
          ),
        ),

      ),
    );
  }
}
