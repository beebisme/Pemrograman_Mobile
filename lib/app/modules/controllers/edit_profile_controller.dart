import 'package:get/get.dart';

class EditProfileController extends GetxController {
  var isProficPicPathSet = false.obs;
  var profilePicPath = "".obs;
  var imgPath = "";
  var imgName = "";

  void setProfileImagePath(String path, String imageName) {
    profilePicPath.value = path;
    imgPath = path;
    imgName = imageName;
    isProficPicPathSet.value = true;
  }
}
