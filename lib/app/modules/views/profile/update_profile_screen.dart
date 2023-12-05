// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/data/models/user_data.dart';
import 'package:flutter_application_1/app/modules/controllers/account_controller.dart';
import 'package:flutter_application_1/app/modules/controllers/database_controller.dart';
import 'package:flutter_application_1/app/modules/controllers/edit_profile_controller.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  EditProfileController editProfileController = Get.find();
  final AccountController accountController = Get.put(AccountController());
  final DatabaseController databaseController = Get.put(DatabaseController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isValidEmail(String value) {
      // Validasi apakah value merupakan alamat email yang benar
      final emailPattern =
          RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
      return emailPattern.hasMatch(value);
    }

    databaseController.readData(accountController.getUserId());

    final formKey = GlobalKey<FormState>();
    _nameController.text = databaseController.datax.value.name ?? '';
    _emailController.text = databaseController.datax.value.email ?? '';
    _phoneController.text = databaseController.datax.value.phone ?? '';
    _passwordController.text = databaseController.datax.value.password ?? '';

    final isFormEmpty = _nameController.text.isEmpty;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#5869ff'),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text(
            "Edit Profile",
            style: TextStyle(color: HexColor('#ffffff')),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  Obx(
                    () => CircleAvatar(
                      backgroundImage:
                          editProfileController.isProficPicPathSet.value == true
                              ? FileImage(File(editProfileController
                                  .profilePicPath.value)) as ImageProvider
                              : const AssetImage(
                                  "assets/images/default_profile.jpg"),
                      radius: 80,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: HexColor('#5869ff'),
                      ),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => bottomSheet(context));
                        },
                        child: const Icon(
                          LineAwesomeIcons.camera,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          label: const Text("Full Name"),
                          prefixIcon: const Icon(LineAwesomeIcons.user),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          prefixIconColor: HexColor('#5869ff'),
                          floatingLabelStyle: TextStyle(
                            color: HexColor('#5869ff'),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              width: 1,
                              color: HexColor('#5869ff'),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Full Name tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            label: const Text("Email"),
                            prefixIcon: const Icon(LineAwesomeIcons.envelope_1),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            prefixIconColor: HexColor('#5869ff'),
                            floatingLabelStyle: TextStyle(
                              color: HexColor('#5869ff'),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    width: 2, color: HexColor('#5869ff')))),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          if (!isValidEmail(value)) {
                            return 'Masukkan alamat email yang valid';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                            label: const Text("Phone"),
                            prefixIcon: const Icon(LineAwesomeIcons.phone),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            prefixIconColor: HexColor('#5869ff'),
                            floatingLabelStyle: TextStyle(
                              color: HexColor('#5869ff'),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    width: 2, color: HexColor('#5869ff')))),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,

                        decoration: InputDecoration(
                            label: const Text("Password"),
                            prefixIcon:
                                const Icon(LineAwesomeIcons.fingerprint),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            prefixIconColor: HexColor('#5869ff'),
                            floatingLabelStyle: TextStyle(
                              color: HexColor('#5869ff'),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    width: 2, color: HexColor('#5869ff')))),
                        keyboardType: TextInputType
                            .visiblePassword, // Mengatur input sesuai dengan kata sandi
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                // Buat objek UserData dari input form
                                UserData userData = UserData(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  password: _passwordController.text,
                                );

                                try {
                                  // Panggil fungsi createData dari DatabaseController
                                  // await databaseController.createData(userData);

                                  if (isFormEmpty) {
                                    log("create");
                                    databaseController.createData(userData,
                                        accountController.getUserId());
                                  } else {
                                    databaseController.updateData(
                                        accountController.getUserId(),
                                        userData);
                                  }

                                  // Navigasi ke halaman lain atau lakukan tindakan lainnya
                                  // Contoh: kembali ke halaman sebelumnya
                                  // Get.back();
                                } catch (error) {
                                  Get.snackbar("error", error.toString());
                                }
                              }
                              // if (formKey.currentState!.validate())
                              //   {Get.to(UpdateProfileScreen())
                              //   }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: HexColor('#5869ff'),
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text(
                              "Save",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => databaseController
                            .deleteData(accountController.getUserId()),
                        child: const Text(
                          "Delete Data",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        )));
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LineAwesomeIcons.image_1,
                      color: HexColor('#5869ff'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Galerry',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#5869ff')),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LineAwesomeIcons.camera,
                      color: HexColor('#5869ff'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#5869ff')),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    editProfileController.setProfileImagePath(
        pickedFile!.path, pickedImage.name);
    Get.back(result: pickedFile!.path);
  }
}
