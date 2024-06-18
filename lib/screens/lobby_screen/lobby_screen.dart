import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/configs/messages.dart';
import 'package:tic_tac_toe/controllers/lobby_controller.dart';
import 'package:tic_tac_toe/controllers/room_controller.dart';
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
    RoomController roomController = Get.put(RoomController());
    RxInt timer = 5.obs;
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
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.player1 == 'ready' &&
                          snapshot.data!.player2 == 'ready') {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Get.to(() => MultiPlayerScreen());
                        });
                      } else {
                        // errorMessage('Wait For Other');
                      }

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
                                status: snapshot.data!.player1Status!,
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
                                      status: snapshot.data!.player2Status!,
                                    ),
                            ],
                          ),
                          SizedBox(height: 20),

                          snapshot.data!.player1!.email ==
                                  roomController.user.value.email
                              ? PrimaryButton(
                                  buttonText: 'Start Game',
                                  onTap: () {
                                    lobbyController.updatePlayer1Status(
                                      roomId,
                                      'ready',
                                    );
                                  },
                                )
                              : snapshot.data!.player2Status == 'waiting'
                                  ? PrimaryButton(
                                      buttonText: 'Ready',
                                      onTap: () async {
                                        lobbyController.updatePlayer2Status(
                                          roomId,
                                          'ready',
                                        );
                                      },
                                    )
                                  : snapshot.data!.player2Status == 'ready'
                                      ? PrimaryButton(
                                          buttonText: 'Waiting for Start',
                                          onTap: () {
                                            lobbyController.updatePlayer2Status(
                                              roomId,
                                              'waiting',
                                            );
                                          },
                                        )
                                      : PrimaryButton(
                                          buttonText: 'Start',
                                          onTap: () {},
                                        ),
                        ],
                      );
                    } else {
                      return Icon(Icons.error);
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
