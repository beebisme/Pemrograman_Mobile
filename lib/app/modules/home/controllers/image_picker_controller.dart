import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/app/modules/home/views/profile/my_galery.dart';

class ImageController extends GetxController {
  var imageList = <ImageModel>[].obs;

  void addImage(ImageModel image,
      {required String title,
      required String description,
      required String imagePath}) {
    imageList.add(image);
  }

  // Fungsi untuk memperbarui imageList
  void refreshImageList() {
    imageList.refresh();
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final title = 'Image Title'; // Ganti dengan judul yang sesuai
      final description =
          'Image Description'; // Ganti dengan deskripsi yang sesuai
      final imagePath = pickedFile.path;
      final newImage = ImageModel(
          title: title, description: description, imagePath: imagePath);
      addImage(newImage, title: '', description: '', imagePath: '');
    }
  }

  void loadImages() {}
}
