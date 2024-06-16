import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/configs/screen_route.dart';
import 'package:tic_tac_toe/configs/theme.dart';
import 'package:tic_tac_toe/screens/auth/auth_screen.dart';
import 'package:tic_tac_toe/screens/room_screen/room_screen.dart';
import 'package:tic_tac_toe/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: pages,
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: lightTheme,
      // home: RoomScreen(),
      // home: SplashScreen(),
      home: AuthScreen(),
    );
  }
}
