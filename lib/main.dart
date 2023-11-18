import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/controllers/auth_controller.dart';
import 'package:flutter_application_1/app/modules/service/notification_handler.dart';
import 'package:flutter_application_1/app/modules/views/home/home_component.dart';
import 'package:flutter_application_1/app/modules/views/register_account/login_page.dart';
import 'package:flutter_application_1/firebase_options.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  final AuthController _authController =
      Get.put(AuthController()); // Buat instance AuthController

  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  await Firebase.initializeApp();

  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();

  runApp(
    GetMaterialApp(
      title: "Application",
      // initialRoute: AppPages.INITIAL,
      initialRoute: _authController.isLoggedIn.value
          ? '/Home'
          : '/Login', // Set initial route based onlogin status
      // getPages: AppPages.routes,
      getPages: [
        GetPage(name: '/Login', page: () => LoginPage()),
        GetPage(name: '/Home', page: () => Home()),
      ],
    ),
  );
}
