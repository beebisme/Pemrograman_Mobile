// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/views/register_account/login_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appwrite/appwrite.dart';

class AuthController extends GetxController {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  late String? userToken;
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;
  late Account account;
  Client client = Client();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Cek status login saat controller diinisialisasi
    account = Account(client);

    client
            .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
            .setProject('65535a71f234118015c3') // Your project ID
        ;
  }

  Future<void> checkLoginStatus() async {
    isLoggedIn.value = _prefs.containsKey('user_token');
  }

  // Appwrite Auth
  Future<void> createUser(String userEmail, String userPassword) async {
    try {
      isLoading.value = true;
      await account.create(
        userId: ID.unique(),
        email: userEmail,
        password: userPassword,
      );

      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.off(const LoginPage());
    } catch (e) {
      Get.snackbar('Error', 'Registration failed: $e',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createSession(String userEmail, String userPassword) async {
    try {
      isLoading.value = true;
      await account.createEmailSession(
        email: userEmail,
        password: userPassword,
      );
      final response = await account.get();
      _prefs.setString('user_token', response.$id);
      userToken = _prefs.getString('user_token');
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green);
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Error', 'Login failed: $e', backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void deleteSession() {
    _prefs.remove('user_token'); // Hapus token autentikasi dari penyimpanan
    isLoggedIn.value = false; // Set status login menjadi false
    account.deleteSessions();
    Get.offAllNamed(
        '/welcome'); // Navigate ke HomePage dan hapus semua halaman sebelumnya
  }

  Future<String> getUserId() async {
    final response = await account.get();
    return response.$id;
  }

  // _databaseController.storeUsername(_authController.userToken!);
  // Future<void> registerUser(String email, String password) async {
  //   try {
  //     isLoading.value = true;
  //     await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     Get.snackbar('Success', 'Registration successful',
  //         backgroundColor: Colors.green);
  //     Get.off(const LoginPage()); //Navigate ke Login Page
  //   } catch (error) {
  //     Get.snackbar('Error', 'Registration failed: $error',
  //         backgroundColor: Colors.red);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Future<void> loginUser(String email, String password) async {
  //   try {
  //     isLoading.value = true;
  //     await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     _prefs.setString(
  //         'user_token', _auth.currentUser!.uid); // Simpan token autentikasi
  //     Get.snackbar('Success', 'Login successful',
  //         backgroundColor: Colors.green);
  //     isLoggedIn.value = true; // Set status login menjadi true
  //     Get.offAllNamed(
  //         '/home'); // Navigate ke HomePage dan hapus semua halaman sebelumnya
  //   } catch (error) {
  //     Get.snackbar('Error', 'Login failed: $error',
  //         backgroundColor: Colors.red);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // void logout() {
  //   _prefs.remove('user_token'); // Hapus token autentikasi dari penyimpanan
  //   isLoggedIn.value = false; // Set status login menjadi false
  //   _auth.signOut(); // Sign out dari Firebase Authentication
  //   Get.offAllNamed(
  //       '/welcome'); // Navigate ke HomePage dan hapus semua halaman sebelumnya
  // }
}
