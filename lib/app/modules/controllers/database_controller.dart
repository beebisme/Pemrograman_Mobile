import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/app/modules/controllers/client_controller.dart';
import 'package:get/get.dart';

class DatabaseController extends ClientController {
  Databases? databases;
  @override
  void onInit() {
    super.onInit();
// appwrite
    databases = Databases(client);
  }

  Future storeUserName(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "6561d15ee70e330ee9fc",
        documentId: ID.unique(),
        collectionId: "6561d1776e8d86f3cbb7",
        data: map,
        permissions: [
          Permission.read(Role.user("6561d2d3ea9834d10f2a")),
          Permission.update(Role.user("6561d2d3ea9834d10f2a")),
          Permission.delete(Role.user("6561d2d3ea9834d10f2a")),
        ],
      );
      print("DatabaseController:: storeUserName $databases");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
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
