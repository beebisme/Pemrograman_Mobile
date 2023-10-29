import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/app/modules/home/controllers/image_picker_controller.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:image/image.dart' as img;

class ImageModel {
  final String title;
  final String description;
  final String imagePath;

  ImageModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class FeedBackScreen extends StatelessWidget {
  final ImageController controller = Get.put(ImageController());

  Future<void> _openImagePickerBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading:
                    Icon(LineAwesomeIcons.image_1, color: HexColor('#5869ff')),
                title: Text(
                  'Gallery',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#5869ff'),
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context); // Tutup bottom sheet
                  await controller.pickImage(ImageSource.gallery);
                  await _resizeImages(); // Panggil fungsi untuk mengubah ukuran gambar
                },
              ),
              ListTile(
                leading:
                    Icon(LineAwesomeIcons.camera, color: HexColor('#5869ff')),
                title: Text(
                  'Camera',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#5869ff'),
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context); // Tutup bottom sheet
                  await controller.pickImage(ImageSource.camera);
                  await _resizeImages(); // Panggil fungsi untuk mengubah ukuran gambar
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _resizeImages() async {
    for (var imageModel in controller.imageList) {
      final imageFile = File(imageModel.imagePath);
      final image = img.decodeImage(imageFile.readAsBytesSync());

      if (image != null) {
        final resizedImage = img.copyResize(image, width: 300, height: 300);

        final resizedImagePath =
            imageModel.imagePath.replaceAll('.jpg', '_resized.jpg');
        File(resizedImagePath).writeAsBytesSync(img.encodeJpg(resizedImage));
      }
    }

    controller.refreshImageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#5869ff'),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          "My Feedbacks",
          style: TextStyle(color: HexColor('#ffffff')),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: (controller.imageList.length / 2).ceil(),
                  itemBuilder: (context, rowIndex) {
                    final startIndex = rowIndex * 2;
                    final endIndex =
                        (startIndex + 2) > controller.imageList.length
                            ? controller.imageList.length
                            : (startIndex + 2);

                    return Row(
                      children: List.generate(endIndex - startIndex, (index) {
                        final image = controller.imageList[startIndex + index];
                        return Expanded(
                          child: Card(
                            child: Column(
                              children: [
                                Image.file(
                                  File(image.imagePath
                                      .replaceAll('.jpg', '_resized.jpg')),
                                  fit: BoxFit.cover,
                                ),
                                ListTile(
                                  title: Text(image.title),
                                  subtitle: Text(image.description),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () => _openImagePickerBottomSheet(context),
          backgroundColor: HexColor('#5869ff'),
          child: const Icon(LineAwesomeIcons.plus),
        ),
      ),
    );
  }
}
