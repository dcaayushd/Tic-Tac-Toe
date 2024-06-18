import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';
import 'package:tic_tac_toe/controllers/auth_controller.dart';
import 'package:tic_tac_toe/widgets/primary_button_with_icon.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // RxBool isLoading = false.obs;
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    IconsPath.appLogo,
                    width: 200,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Please sign in to continue.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 200),
              PrimaryButtonWithIcon(
                buttonText: 'Sign in with Google',
                onTap: () {
                  authController.login();
                },
                iconPath: IconsPath.google,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
