import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isValidEmail(String value) {
      // Validasi apakah value merupakan alamat email yang benar
      final emailPattern =
          RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
      return emailPattern.hasMatch(value);
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Register'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/doctor.png"))),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (!isValidEmail(value)) {
                    return 'Masukkan alamat email yang valid';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  )),
              const SizedBox(height: 16),
              Obx(() {
                return InkWell(
                  onTap: _authController.isLoading.value
                      ? null
                      : () {
                          _authController.register(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: HexColor("#5182F6"),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                            child: _authController.isLoading.value
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : const Text(
                                    "Register",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ))),
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sudah Punya Akun?",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/login");
                    },
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: HexColor("#5182F6"))),
                  )
                ],
              )
              // Obx(() {
              //   return ElevatedButton(
              //     onPressed: _authController.isLoading.value
              //         ? null
              //         : () {
              //             _authController.registerUser(
              //               _emailController.text,
              //               _passwordController.text,
              //             );
              //           },
              //     child: _authController.isLoading.value
              //         ? CircularProgressIndicator()
              //         : Text('Register'),
              //   );
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
