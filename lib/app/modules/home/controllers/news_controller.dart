import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/app/model/news_model.dart';

class NewsController extends GetxController {
  // late Future<Todo> data;
  var newsList = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    // data = fetchData();
    fetchData();
  }

  Future<void> fetchData() async {
    var response = await http
        .get(Uri.parse("https://653c7d7fd5d6790f5ec80597.mockapi.io/news"));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      var res = jsonData[0];
      News news = News.fromJson(res);

      newsList.assignAll(news.articles);
    } else {
      throw Exception("Request Failed");
    }
  }
}
