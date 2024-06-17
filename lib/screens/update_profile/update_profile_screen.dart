import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tic_tac_toe/controllers/profile_controller.dart';
import 'package:tic_tac_toe/widgets/primary_button_with_icon.dart';

import '../../configs/assets_path.dart';
import '../../controllers/auth_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    RxString imagePath = ''.obs;
    TextEditingController nameController = TextEditingController();
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
                      Obx(
                        () => imagePath == ''
                            ? Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              )
                            : Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.circular(40),
                                  // image: DecorationImage(
                                  //   image: AssetImage(imagePath.value),
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.file(
                                    File(
                                      imagePath.value,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              imagePath.value = await profileController
                                  .pickImage(ImageSource.gallery);
                            },
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
                            onTap: () async {
                              imagePath.value = await profileController
                                  .pickImage(ImageSource.camera);
                            },
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
                    controller: nameController,
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
              Obx(
                () => profileController.isLoading.value
                    ? CircularProgressIndicator()
                    : PrimaryButtonWithIcon(
                        buttonText: 'Save',
                        onTap: () {
                          profileController.updateProfile(
                            nameController.text,
                            imagePath.value,
                          );
                        },
                        iconPath: IconsPath.save,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
