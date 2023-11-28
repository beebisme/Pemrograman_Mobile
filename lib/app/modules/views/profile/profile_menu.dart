// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/controllers/auth_controller.dart';
import 'package:flutter_application_1/app/modules/controllers/edit_profile_controller.dart';
import 'package:flutter_application_1/app/modules/views/profile/my_galery.dart';
import 'package:flutter_application_1/app/modules/views/profile/update_profile_screen.dart';
import 'package:flutter_application_1/app/modules/views/profile/widget/profile_content.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileMenu extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  ProfileMenu({super.key});
  String? imagePath;

  EditProfileController editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#5869ff'),
          title: Text(
            "Profile",
            style: TextStyle(color: HexColor('#ffffff')),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  // Show dari database code ini
                  // CircleAvatar(
                  //   backgroundImage:
                  //       AssetImage("assets/images/default_profile.jpg"),
                  //   radius: 80,
                  // ),

                  // show image dari perubahan edit sebelum terpasang database
                  Obx(
                    () => CircleAvatar(
                      backgroundImage: editProfileController
                              .isProficPicPathSet.value
                          ? FileImage(
                              File(editProfileController.profilePicPath.value))
                          : const AssetImage(
                                  "assets/images/default_profile.jpg")
                              as ImageProvider,
                      radius: 80,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: HexColor('#5869ff'),
                      ),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text("Ta'nis Alhariroh",
                  style: Theme.of(context).textTheme.headlineSmall),
              Text("tanialhariroh@webmail.umm.ac.id",
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  // function sesudah ada nya database
                  // onPressed: () => Get.to(() => UpdateProfileScreen()),
                  onPressed: () async {
                    final newImagePath =
                        await Get.to(() => UpdateProfileScreen());
                    if (newImagePath != null) {
                      imagePath = newImagePath;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("#5869ff"),
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: HexColor("#ffffff")),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),

              // Menu
              ProfileMenuWidget(
                title: "Settings",
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "History",
                icon: LineAwesomeIcons.history,
                onPress: () {},
              ),
              ProfileMenuWidget(
                  title: "My Feedbacks",
                  icon: LineAwesomeIcons.identification_badge,
                  onPress: () => Get.to(() => FeedBackScreen())),
              ProfileMenuWidget(
                title: "Term & Condition",
                icon: LineAwesomeIcons.balance_scale,
                onPress: () {},
              ),
              const Divider(color: Colors.grey),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: "Information",
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Change Language",
                icon: LineAwesomeIcons.language,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  _authController.deleteSession();
                },
              ),
            ],
          ),
        )));
  }
}
