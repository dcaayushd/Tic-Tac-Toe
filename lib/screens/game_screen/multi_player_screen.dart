import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/multi_player_controller.dart';
import 'package:tic_tac_toe/models/room_model.dart';
import 'package:tic_tac_toe/widgets/in_game_user_card.dart';

import '../../configs/assets_path.dart';
import '../../controllers/auth_controller.dart';

class MultiPlayerScreen extends StatelessWidget {
  final String roomId;
  const MultiPlayerScreen({
    super.key,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    MultiPlayerController multiPlayerController =
        Get.put(MultiPlayerController());
    AuthController authController = Get.put(AuthController());
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: SvgPicture.asset(
              IconsPath.msgIcon,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: StreamBuilder(
                  stream: multiPlayerController.getRoomDetails(roomId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      RoomModel? roomData = snapshot.data;
                      var playValue = roomData!.gameValue;
                      return Column(
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
                                'Back',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  InGameUserCard(
                                    playIcon: IconsPath.xIcon,
                                    name: roomData.player1!.name!,
                                    imageUrl: roomData.player1!.image!,
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 25,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          IconsPath.wonIcon,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                            'WON : ${roomData.player1!.totalWins}')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  InGameUserCard(
                                    playIcon: IconsPath.oIcon,
                                    name: roomData.player2!.name!,
                                    imageUrl: roomData.player2!.image!,
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 25,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          IconsPath.wonIcon,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                            'WON : ${roomData.player2!.totalWins}')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            color: Theme.of(context).colorScheme.primary,
                            strokeWidth: 2,
                            dashPattern: [10, 10],
                            radius: Radius.circular(20),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: w,
                              height: w - 33,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: GridView.builder(
                                itemCount: 9,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      multiPlayerController.updateData(
                                        roomId,
                                        playValue,
                                        index,
                                        roomData.isXturn!,
                                        roomData,
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(0.5),
                                      decoration: BoxDecoration(
                                        color: playValue![index] == 'X'
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : playValue[index] == 'O'
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                : playValue[index] == ''
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                        borderRadius: index == 0
                                            ? BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                              )
                                            : index == 2
                                                ? BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20),
                                                  )
                                                : index == 6
                                                    ? BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(20),
                                                      )
                                                    : index == 8
                                                        ? BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20),
                                                          )
                                                        : BorderRadius.only(),
                                      ),
                                      child: Center(
                                        child: playValue[index] == 'X'
                                            ? SvgPicture.asset(
                                                IconsPath.xIcon,
                                                width: 45,
                                              )
                                            : playValue[index] == 'O'
                                                ? SvgPicture.asset(
                                                    IconsPath.oIcon,
                                                    width: 50,
                                                  )
                                                : playValue[index] == ''
                                                    ? SizedBox()
                                                    : SizedBox(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                duration: const Duration(milliseconds: 500),
                                decoration: BoxDecoration(
                                  color: roomData.isXturn == true
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    roomData.isXturn == true
                                        ? SvgPicture.asset(
                                            IconsPath.xIcon,
                                            width: 30,
                                          )
                                        : SvgPicture.asset(
                                            IconsPath.oIcon,
                                            width: 30,
                                          ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'Turn',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Text('No Data');
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: multiPlayerController.confettiController,
          shouldLoop: false,
          blastDirection: pi / 2,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Colors.green,
            Colors.deepPurple,
          ],
          gravity: 0.01,
          emissionFrequency: 0.05,
        ),
      ],
    );
  }
}
