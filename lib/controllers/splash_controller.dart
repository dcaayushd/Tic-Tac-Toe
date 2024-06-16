import 'package:get/get.dart';

import '../welcome/welcome_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    splashHandle();
    super.onInit();
  }

  Future<void> splashHandle() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(WelcomeScreen());
  }
}
