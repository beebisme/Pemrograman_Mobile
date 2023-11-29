// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/controllers/account_controller.dart';
import 'package:flutter_application_1/app/modules/controllers/auth_controller.dart';
import 'package:flutter_application_1/app/modules/service/notification_handler.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async => await SharedPreferences
      .getInstance()); // menyimpan data secara persisten pada perangkat
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions
          .currentPlatform); // menginisialisasi firebas pada aplikasi

  final AuthController _authController =
      Get.put(AuthController()); // Buat instance AuthController

  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      // initialRoute: AppPages.INITIAL,
      initialRoute: _authController.isLoggedIn.value
          ? '/home'
          : '/welcome', // Set initial route based onlogin status
      getPages: AppPages.routes, // daftar route yang didefinisikan di AppPages
    ),
  );
  Get.put(AccountController());
}
