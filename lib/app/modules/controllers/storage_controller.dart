import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  Storage? storage;
  Client client = Client();

  @override
  void onInit() {
    super.onInit();

    client
            .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
            .setProject('65535a71f234118015c3') // Your project ID
        ;

    storage = Storage(client);
  }

  Future<void> uploadImage() async {}
}
