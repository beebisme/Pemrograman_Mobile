import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/controllers/account_controller.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  final AccountController accountController =
      Get.find(); // Pastikan controller telah diinisialisasi

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
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
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createAccount();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  void _createAccount() async {
    Map<String, dynamic> userMap = {
      'email': emailController.text,
      'password': passwordController.text,
      'name': nameController.text,
    };

    await accountController.createAccount(userMap);
  }
}
