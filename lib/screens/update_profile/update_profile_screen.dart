import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/widgets/primary_button_with_icon.dart';

import '../../configs/assets_path.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SvgPicture.asset(
                                IconsPath.gallery,
                                width: 40,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SvgPicture.asset(
                                IconsPath.camera,
                                width: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter your name'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'You can change these details later from the profile page. Don\'t worry!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              PrimaryButtonWithIcon(
                buttonText: 'Save',
                onTap: () {},
                iconPath: IconsPath.save,
              )
            ],
          ),
        ),
      ),
    );
  }
}
