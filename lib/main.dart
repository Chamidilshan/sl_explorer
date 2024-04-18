import 'package:SL_Explorer/bindings/general_binding.dart';
import 'package:SL_Explorer/common/snackbar.dart';
import 'package:SL_Explorer/features/authentication/screens/email_verification_screen.dart';
import 'package:SL_Explorer/features/authentication/screens/success_verification_screen.dart';
import 'package:SL_Explorer/firebase_options.dart';
import 'package:SL_Explorer/formtest.dart';
import 'package:SL_Explorer/providers/a_z_provider.dart';
import 'package:SL_Explorer/providers/day_trips_provider.dart';
import 'package:SL_Explorer/providers/orders_provider.dart';
import 'package:SL_Explorer/providers/round_trips_provider.dart';
import 'package:SL_Explorer/services/firebase_services/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'services/firebase_services/authentication_repository.dart';
import 'package:SL_Explorer/providers/festivals.provider.dart';

//Brightness mode = Brightness.light;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RoundTripProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context)=> FestivalProvider()),
        ChangeNotifierProvider(create: (context) => DayTripProvider()),
        ChangeNotifierProvider(create: (context)=> A_ZProvider()),
      ],
      child: MyApp(),
    ),
  );
}

Future<void> initializeServices() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value)=> Get.put(AuthenticationRepository())
  );
  await FirebaseNotificationApi().initNotifications();
  await FirebaseMessaging.instance.subscribeToTopic('ALL');
}


// Future<void> main() async{
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => RoundTripProvider()),
//         ChangeNotifierProvider(create: (context) => OrderProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
//           (FirebaseApp value)=> Get.put(AuthenticationRepository())
//   );
//   await FirebaseNotificationApi().initNotifications();
//   await FirebaseMessaging.instance.subscribeToTopic('ALL');
//
// }

class MyApp extends StatelessWidget {

  MyApp({super.key});

  // static void changeMode(){
  //
  //   if(mode == Brightness.dark){
  //     mode = Brightness.light;
  //   }else{
  //     mode = Brightness.dark;
  //   }
  //   CommonLoaders.successSnackBar(title: "Restart The App", duration: 4, message: "Restart the application");
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      initialBinding: GeneralBindings(),
      // builder: DevicePreview.appBuilder,
      // title: 'Sign up',
      // theme: ThemeData(
      //   brightness: Brightness.light,
      // ),
      home: const CircularProgressIndicator(
          color: Color(0xFFFD8103),
      ),
    );
  }
}