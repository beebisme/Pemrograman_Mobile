import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_application_1/app/data/models/user_data.dart';
import 'package:flutter_application_1/app/modules/controllers/client_controller.dart';
import 'package:flutter_application_1/app/modules/views/profile/profile_menu.dart';
import 'package:get/get.dart';

class DatabaseController extends ClientController {
  Databases? databases;
  Rx<UserData> datax = UserData().obs;
  @override
  void onInit() {
    super.onInit();
// appwrite
    databases = Databases(client);
  }

  Future<void> createData(UserData userData, Future userId) async {
    // mengambil userId yg berhasil login
    final documentId = await userId;

    try {
      if (databases != null) {
        final Map<String, dynamic> data = {
          'name': userData.name,
          'email': userData.email,
          'phone': userData.phone,
          'password': userData.password,
          // Tambahkan field lain sesuai kebutuhan
        };

        final Document result = await databases!.createDocument(
          databaseId: '6561d15ee70e330ee9fc',
          collectionId: '6566ba720a806cf878ad',
          documentId: documentId,
          data: data,
        );

        if (result != null) {
          Get.snackbar('Berhasil', 'Data berhasil dibuat');
        } else {
          Get.snackbar('Error', 'Gagal membuat data');
        }
      } else {
        Get.snackbar('Error', 'Databases kosong');
      }
    } catch (error) {
      Get.snackbar('Error', 'Terjadi kesalahan: $error');
    }
  }

  Future<void> readData(Future userId) async {
    final documentId = await userId;

    try {
      if (databases != null) {
        final result = await databases!.getDocument(
          databaseId: "6561d15ee70e330ee9fc",
          collectionId: "6566ba720a806cf878ad",
          documentId: documentId,
        );

        // if (result == 200) {
        Get.snackbar('Success', 'Data retrieved successfully');
        // data.value = result.data.toString();
        UserData userData = UserData.fromJson(result.data);
        datax.value = userData;
        // Handle retrieved data (result.data)
        // } else {
        //   Get.snackbar('Error', 'Failed to retrieve data: ${result}');
        // }
      } else {
        Get.snackbar('Error', 'Databases is null');
      }
    } catch (error) {
      // Get.snackbar('Error', 'An error occurred: $error');
      log(error.toString());
    }
  }

  Future<void> updateData(Future userId, UserData userData) async {
    final documentId = await userId;

    try {
      final Map<String, dynamic> newData = {
        'name': userData.name,
        'email': userData.email,
        'phone': userData.phone,
        'password': userData.password,
        // Tambahkan field lain sesuai kebutuhan
      };

      final result = await databases!.updateDocument(
        databaseId: "6561d15ee70e330ee9fc",
        collectionId: "6566ba720a806cf878ad",
        documentId: documentId,
        data: newData,
      );

      ;

      Get.snackbar("Success", "Your Data Have Been Updated");
    } catch (error) {
      Get.snackbar('Error', 'An error occurred: $error');
    }
  }

  Future<void> deleteData(Future userId) async {
    final documentId = await userId;

    try {
      if (databases != null) {
        final result = await databases!.deleteDocument(
          databaseId: "6561d15ee70e330ee9fc",
          collectionId: "6566ba720a806cf878ad",
          documentId: documentId,
        );

        readData(userId);
        Get.snackbar("Success", "Data Berhasil Dihapus");

        Get.off(ProfileMenu());
      } else {
        Get.snackbar('Error', 'Databases is null');
      }
    } catch (error) {
      Get.snackbar('Error', 'An error occurred: $error');
    }
  }
}

class DocumentResponse {
  late int statusCode;
  late Map<String, dynamic> body;

  DocumentResponse({required this.statusCode, required this.body});
}
