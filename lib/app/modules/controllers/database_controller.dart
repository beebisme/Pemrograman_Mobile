import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/data/models/user_data.dart';
import 'package:flutter_application_1/app/modules/controllers/client_controller.dart';
import 'package:get/get.dart';

class DatabaseController extends ClientController {
  Databases? databases;
  Rx<UserData> datax = UserData().obs;
  @override
  void onInit() {
    super.onInit();
// appwrite
    databases = Databases(client);
    readData('user123');
  }

  Future storeUserName(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "6561d15ee70e330ee9fc",
        documentId: ID.unique(),
        collectionId: "6566ba720a806cf878ad",
        data: map,
        permissions: [
          Permission.read(Role.user("user123")),
          Permission.update(Role.user("user123")),
          Permission.delete(Role.user("user123")),
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

  Future<void> createData(UserData userData) async {
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
          documentId: ID.unique(),
          data: data,
          permissions: [
            Permission.read(Role.user('user123')),
            Permission.write(Role.user('user123')),
          ],
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

  Future<void> readData(String documentId) async {
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
      Get.snackbar('Error', 'An error occurred: $error');
    }
  }

  Future<void> updateData(
      String documentId, Map<String, dynamic> newData) async {
    try {
      if (databases != null) {
        final result = await databases!.updateDocument(
          databaseId: "6561d15ee70e330ee9fc",
          collectionId: "6566ba720a806cf878ad",
          documentId: documentId,
          data: newData,
        );

        if (result == 200) {
          Get.snackbar('Success', 'Data updated successfully');
        } else {
          Get.snackbar('Error', 'Failed to update data: ${result}');
        }
      } else {
        Get.snackbar('Error', 'Databases is null');
      }
    } catch (error) {
      Get.snackbar('Error', 'An error occurred: $error');
    }
  }

  Future<void> deleteData(String documentId) async {
    try {
      if (databases != null) {
        final result = await databases!.deleteDocument(
          databaseId: "6561d15ee70e330ee9fc",
          collectionId: "6566ba720a806cf878ad",
          documentId: documentId,
        );

        if (result.statusCode == 200) {
          Get.snackbar('Success', 'Data deleted successfully');
        } else {
          Get.snackbar('Error', 'Failed to delete data: ${result.body}');
        }
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
