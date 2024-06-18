import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/multi_player_controller.dart';
import 'package:tic_tac_toe/models/room_model.dart';
import 'package:tic_tac_toe/widgets/in_game_user_card.dart';

import '../../configs/assets_path.dart';

class MultiPlayerScreen extends StatelessWidget {
  final String roomId;
  const MultiPlayerScreen({
    super.key,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    var playValue = [
      'X',
      'O',
      '',
      '',
      'O',
      '',
      '',
      'X',
      'O',
    ];
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    MultiPlayerController multiPlayerController =
        Get.put(MultiPlayerController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: SvgPicture.asset(
          IconsPath.msgIcon,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: SafeArea(
        child: Padding(
          // padding: const EdgeInsets.all(20.0),
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
                                    Text('WON : ${roomData.player1!.totalWins}')
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
                                    Text('WON : ${roomData.player2!.totalWins}')
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
                                        ? Theme.of(context).colorScheme.primary
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
                                                topRight: Radius.circular(20),
                                              )
                                            : index == 6
                                                ? BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                  )
                                                : index == 8
                                                    ? BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(20),
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
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: roomData.isXturn == true
                                ? Row(
                                    children: [
                                      SvgPicture.asset(
                                        IconsPath.xIcon,
                                        width: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Turn',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      SvgPicture.asset(
                                        IconsPath.oIcon,
                                        width: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Turn',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
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
    );
  }
}
