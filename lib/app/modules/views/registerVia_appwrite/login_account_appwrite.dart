import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/controllers/account_controller.dart';
import 'package:get/get.dart';

class LoginEmailSessionScreen extends StatelessWidget {
  final AccountController accountController =
      Get.find(); // Pastikan controller telah diinisialisasi

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Email Session'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createEmailSession();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _createEmailSession() async {
    Map<String, dynamic> loginMap = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    await accountController.createEmailSession(loginMap);
  }
}
