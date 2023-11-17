// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/views/home/home_component.dart';
import 'package:flutter_application_1/app/modules/views/home_view.dart';
import 'package:flutter_application_1/app/modules/views/login/login_view.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  Future<void> register(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Register successful',
          backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar("Error", "Error : $e", backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
      Get.to(() => const LoginScreen());
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green);
      Get.to(() => const Home());
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void logOut() async {
    await _auth.signOut();
    Get.offAll(const HomeView());
  }
}
