import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';
import 'package:tic_tac_toe/screens/lobby_screen/lobby_screen.dart';
import 'package:tic_tac_toe/widgets/primary_button.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
              SizedBox(
                height: 40,
              ),
              Text(
                'Enter Private Code And Join With Your Friend',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter Code Here',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                buttonText: 'Join Now',
                onTap: () {
                  Get.toNamed('/lobby');
                },
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Create Private Room ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Spacer(),
              PrimaryButton(
                buttonText: 'Create Room',
                onTap: () {
                  Get.toNamed('/lobby');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
