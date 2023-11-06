import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/views/component/card_news.dart';

class NewsComponents extends StatelessWidget {
  const NewsComponents(
      {super.key,
      required this.title,
      required this.imgUrl,
      required this.title2,
      required this.imgUrl2,
      required this.webUrl,
      required this.webUrl2});

  final String title, imgUrl, title2, imgUrl2, webUrl, webUrl2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardNews(
            title: title,
            imageUrl: imgUrl,
            webUrl: webUrl,
          ),
          Spacer(),
          CardNews(
            title: title2,
            imageUrl: imgUrl2,
            webUrl: webUrl2,
          )
        ],
      ),
    );
  }
}
