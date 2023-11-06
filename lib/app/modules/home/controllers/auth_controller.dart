// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/home/home_component.dart';
import 'package:flutter_application_1/app/modules/home/views/login/login_view.dart';
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
    } catch (e) {
      Get.snackbar("error", "Error : $e", backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
      Get.to(() => const LoginScreen());
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("Success", "Login Successfull");
    } finally {
      isLoading.value = false;
      Get.to(() => const Home());
    }
  }
}
