import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/lobby_controller.dart';
import 'package:tic_tac_toe/screens/game_screen/multi_player_screen.dart';

import '../../configs/assets_path.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/user_card.dart';

import 'components/pricing_area.dart';
import 'components/room_info.dart';

class LobbyScreen extends StatelessWidget {
  final String roomId;
  const LobbyScreen({
    super.key,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    LobbyController lobbyController = Get.put(LobbyController());
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
                RoomInfo(roomCode: roomId),
                // SizedBox(height: 40),
                SizedBox(height: 20),
                StreamBuilder(
                  stream: lobbyController.getRoomDetails(roomId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        children: [
                          PriceArea(
                            entryPrice: snapshot.data!.entryFee!,
                            winningPrice: snapshot.data!.winningPrize!,
                          ),
                          // SizedBox(height: 90),
                          SizedBox(height: 80),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserCard(
                                imageUrl: snapshot.data!.player1!.image!,
                                name: snapshot.data!.player1!.name!,
                                coins: '00',
                                // coins: snapshot.data!.player1!.coins!,
                              ),
                              snapshot.data!.player2 == null
                                  ? Container(
                                      width: w / 2.6,
                                      child: Text('Waiting for other Player'),
                                    )
                                  : UserCard(
                                      imageUrl: snapshot.data!.player2!.image!,
                                      name: snapshot.data!.player2!.name!,
                                      coins: '00',
                                      // coins: snapshot.data!.player2!.coins!,
                                    ),
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
                      );
                    }
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
