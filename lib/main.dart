import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/configs/screen_route.dart';
import 'package:tic_tac_toe/configs/theme.dart';
import 'package:tic_tac_toe/firebase_options.dart';
import 'package:tic_tac_toe/screens/splash/splash_screen.dart';
import 'package:tic_tac_toe/screens/update_profile/update_profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: FToastBuilder(),
      getPages: screens,
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: lightTheme,
      home: SplashScreen(),
      // home: UpdateProfileScreen(),
    );
  }
}
