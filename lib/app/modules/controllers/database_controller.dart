import 'package:flutter_application_1/app/modules/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

class DatabaseController extends GetxController {
  final AuthController _authController = Get.put(AuthController());

  Client client = Client();
  late Databases db;
  final userDatabaseId = "655ea30ad5341ad32d68";
  final userCollectionId = "655ea3173f63d1a6f99c";

  @override
  void onInit() {
    super.onInit();

    client
            .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
            .setProject('65535a71f234118015c3') // Your project ID
        ;
    db = Databases(client);
  }

  Future<void> storeUsername(String userId) async {
    try {
      await db.createDocument(
        databaseId: userDatabaseId,
        collectionId: userCollectionId,
        documentId: ID.unique(),
        data: {'user_id': userId},
      );
    } catch (e) {
      print(e);
    }
  }

  Future<bool> checkData() async {
    final result = await db.listDocuments(
      databaseId: userDatabaseId,
      collectionId: userCollectionId,
    );

    String searchString = '65654400727cf199031f';
    final data = result.documents;
    bool isContained =
        data.any((element) => element.data['user_id'] == searchString);

    return isContained;
  }

  Future<void> writeToDb() async {
    final notEmpty = await checkData();
    print(notEmpty);

    if (!notEmpty) {
      storeUsername(_authController.userToken!);
    } else {
      return;
    }
  }
}
