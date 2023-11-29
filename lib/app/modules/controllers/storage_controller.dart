import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/app/modules/controllers/client_controller.dart';
import 'package:get/get.dart';

class StorageController extends ClientController {
  Storage? storage;
  @override
  void onInit() {
    super.onInit();
// appwrite
    storage = Storage(client);
  }

  Future storeImage(String imgPath, String imgName) async {
    try {
      final result = await storage!.createFile(
        bucketId: '6566c841487a3f65533c',
        fileId: ID.unique(),
        file: InputFile.fromPath(
          path: imgPath,
          filename: imgName,
        ),
      );
      print("StorageController:: storeImage $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Storage",
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
