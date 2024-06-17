import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screens/home/home_screen.dart';

import '../screens/welcome/welcome_screen.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;
  @override
  void onInit() {
    splashHandle();
    super.onInit();
  }

  Future<void> splashHandle() async {
    await Future.delayed(const Duration(seconds: 3));
    if (auth.currentUser == null) {
      Get.offAll(() => WelcomeScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }
}
