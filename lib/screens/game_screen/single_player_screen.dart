import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/single_player_controller.dart';

import '../../configs/assets_path.dart';

class SinglePlayerScreen extends StatelessWidget {
  const SinglePlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    SinglePlayerController singlePlayerController =
        Get.put(SinglePlayerController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                    SizedBox(width: 15.0),
                    Text(
                      'Play Online',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 45,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            IconsPath.xIcon,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 25,
                          ),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                IconsPath.wonIcon,
                              ),
                              SizedBox(width: 10),
                              Obx(
                                () => Text(
                                    'WON : ${singlePlayerController.xScore}'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 45,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            IconsPath.oIcon,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 25,
                          ),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                IconsPath.wonIcon,
                              ),
                              SizedBox(width: 10),
                              Obx(
                                () => Text(
                                    'WON : ${singlePlayerController.oScore}'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 60),
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
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Obx(
                      () => GridView.builder(
                        itemCount: singlePlayerController.playValue.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              singlePlayerController.onClick(index);
                            },
                            child: Container(
                              margin: EdgeInsets.all(0.5),
                              decoration: BoxDecoration(
                                color: singlePlayerController
                                            .playValue[index] ==
                                        'X'
                                    ? Theme.of(context).colorScheme.primary
                                    : singlePlayerController.playValue[index] ==
                                            'O'
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : singlePlayerController
                                                    .playValue[index] ==
                                                ''
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
                                                bottomLeft: Radius.circular(20),
                                              )
                                            : index == 8
                                                ? BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(20),
                                                  )
                                                : BorderRadius.only(),
                              ),
                              child: Center(
                                child: singlePlayerController
                                            .playValue[index] ==
                                        'X'
                                    ? SvgPicture.asset(
                                        IconsPath.xIcon,
                                        width: 45,
                                      )
                                    : singlePlayerController.playValue[index] ==
                                            'O'
                                        ? SvgPicture.asset(
                                            IconsPath.oIcon,
                                            width: 50,
                                          )
                                        : singlePlayerController
                                                    .playValue[index] ==
                                                ''
                                            ? SizedBox()
                                            : SizedBox(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(
                          color: singlePlayerController.isXtime.value
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            singlePlayerController.isXtime.value
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
                                fontSize: 25,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
