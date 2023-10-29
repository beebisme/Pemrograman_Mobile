import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/webview/news_webview.dart';
import 'package:get/get.dart';

class CardNews extends StatelessWidget {
  const CardNews(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.webUrl})
      : super(key: key);

  final String title, imageUrl, webUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => NewsWebView(url: webUrl)),
      child: Container(
        width: 170.0,
        height: 180.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  )),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                  child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
