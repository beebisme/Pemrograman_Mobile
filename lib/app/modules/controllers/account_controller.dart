import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/controllers/client_controller.dart';
import 'package:flutter_application_1/app/modules/views/home/home_component.dart';
import 'package:flutter_application_1/app/modules/views/home_view.dart';
import 'package:flutter_application_1/app/modules/views/registerVia_appwrite/login_account_appwrite.dart';
import 'package:get/get.dart';

class AccountController extends ClientController {
  Account? account;
  @override
  void onInit() {
    super.onInit();
// appwrite
    account = Account(client);
  }

  Future createAccount(Map map) async {
    try {
      final result = await account!.create(
        userId: ID.unique(),
        email: map['email'],
        password: map['password'],
        name: map['name'],
      );
      print("AccountController:: createAccount $result");
      Get.off(LoginEmailSessionScreen());
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future createEmailSession(Map map) async {
    try {
      final result = await account!.createEmailSession(
        email: map['email'],
        password: map['password'],
      );
      print("AccountController:: createEmailSession $result");

      Get.to(() => const Home());
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future deleteSession() async {
    try {
      final result = await account!.deleteSessions();

      Get.offAll(const HomeView());
    } catch (e) {
      print(e);
    }
  }

  Future getUserId() async {
    try {
      final result = await account!.get();
      return result.$id;
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}
