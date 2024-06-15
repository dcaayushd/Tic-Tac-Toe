import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/screens/lobby_screen/widgets/pricing_area.dart';
import 'package:tic_tac_toe/screens/lobby_screen/widgets/room_info.dart';
// import 'package:get/get.dart';

import '../../configs/assets_path.dart';
// import '../../widgets/primary_button.dart';

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
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(IconsPath.backIcon),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'Play With Private Room',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RoomInfo(roomCode: '123456'),
              SizedBox(
                height: 40,
              ),
              PriceArea(entryPrice: '23', winningPrice: '46'),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
