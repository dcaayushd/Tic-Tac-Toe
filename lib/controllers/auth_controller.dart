import 'package:get/get.dart';
import 'package:tic_tac_toe/screens/home/home_screen.dart';
import 'package:tic_tac_toe/screens/update_profile/update_profile_screen.dart';

class AuthController extends GetxController {
  Future<void> login() async {
    Get.to(UpdateProfileScreen());
  }

  Future<void> updateProfile() async {
    Get.to(HomeScreen());
  }
}
