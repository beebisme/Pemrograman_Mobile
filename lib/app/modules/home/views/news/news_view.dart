import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/news_controller.dart';
import 'package:flutter_application_1/app/modules/home/views/component/card_news_horizontal.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class NewsView extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());
  NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#5869ff'),
        title: Text(
          "News",
          style: TextStyle(color: HexColor('#ffffff')),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => newsController.newsList.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: newsController.newsList.length,
                  itemBuilder: (context, index) {
                    final news = newsController.newsList[index];
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardNewsHorizontal(
                          title: news.title,
                          imageUrl: news.urlToImage,
                          author: news.author,
                          webUrl: news.url,
                        ));
                  },
                ),
        ),
      ),
    );
  }
}
