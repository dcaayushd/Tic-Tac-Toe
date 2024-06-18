import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screens/game_screen/multi_player_screen.dart';
// import 'package:get/get.dart';

import '../../configs/assets_path.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/user_card.dart';

import 'components/pricing_area.dart';
import 'components/room_info.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(IconsPath.backIcon),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Play With Private Room',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                RoomInfo(roomCode: '123456'),
                // SizedBox(height: 40),
                SizedBox(height: 20),
                PriceArea(entryPrice: '23', winningPrice: '46'),
                // SizedBox(height: 90),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserCard(),
                    UserCard(),
                  ],
                ),
                SizedBox(height: 20),
                PrimaryButton(
                  buttonText: 'Start Game',
                  onTap: () {
                    Get.to(
                      () => MultiPlayerScreen(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
