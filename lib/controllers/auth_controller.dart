import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:tic_tac_toe/screens/update_profile/update_profile_screen.dart';

import '../configs/Messages.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  // final db = FirebaseFirestore.instance;
  Future<void> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
      successMessage("Login Success");
      Get.to(() => UpdateProfileScreen());
    } catch (e) {
      errorMessage("Login Failed");
      print(e);
    }
  }
}
