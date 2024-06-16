import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/widgets/in_game_user_card.dart';

import '../../configs/assets_path.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // padding: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(IconsPath.backIcon),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'Play Online',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InGameUserCard(
                        playIcon: IconsPath.xIcon,
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              IconsPath.wonIcon,
                            ),
                            SizedBox(width: 10),
                            Text('WON : 12')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InGameUserCard(
                        playIcon: IconsPath.oIcon,
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              IconsPath.wonIcon,
                            ),
                            SizedBox(width: 10),
                            Text('WON : 12')
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
