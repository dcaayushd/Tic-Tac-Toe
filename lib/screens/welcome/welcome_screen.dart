import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';
import 'package:tic_tac_toe/screens/auth/auth_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screens = [
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome1),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'Most fun game now available on your smartphone device!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome2),
            Text(
              'Compete',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'Play online with your friends and top the leaderboard!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome3),
            Text(
              'Scoreboard',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'Earn points for each game and make your way to top the scoreboard!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.offAll(
                  () => AuthScreen(),
                );
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: Center(
        child: ConcentricPageView(
          colors: [
            Colors.red,
            Colors.blue,
            Colors.green,
          ],
          itemCount: 3,
          physics: BouncingScrollPhysics(),
          onFinish: () {
            Get.offAll(
              () => AuthScreen(),
            );
          },
          itemBuilder: (index) {
            return screens[index];
          },
        ),
      ),
    );
  }
}
