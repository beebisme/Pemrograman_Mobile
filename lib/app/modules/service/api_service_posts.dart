import 'dart:convert';
import 'package:flutter_application_1/app/modules/service/model_posts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ApiService extends GetxController {
  RxBool isLoading = false.obs; // Observable boolean for loading state
  Future<Posts> fetchPosts(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
// If the server did return a 200 OK response,
// then parse the JSON.
      return Posts.fromJson(jsonDecode(response.body));
    } else {
// If the server did not return a 200 OK response,
// then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
