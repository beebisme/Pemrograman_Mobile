import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

class ClientController extends GetxController {
  Client client = Client();
  @override
  void onInit() {
    super.onInit();

    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('65535a71f234118015c3')
        .setSelfSigned(status: true);
  }
}
