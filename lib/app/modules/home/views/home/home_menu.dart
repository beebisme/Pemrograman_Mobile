import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/news_controller.dart';
import 'package:flutter_application_1/app/modules/home/views/home/header_component.dart';
import 'package:flutter_application_1/app/modules/home/views/home/menu_component.dart';
import 'package:flutter_application_1/app/modules/home/views/home/news_component.dart';
import 'package:flutter_application_1/app/modules/home/views/home/news_skelton_component.dart';
import 'package:flutter_application_1/app/modules/home/views/news/news_view.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    var data = newsController.newsList;
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 920,
            child: Column(
              children: [
                Container(
                  height: 270,
                  color: HexColor("#ffffff"),
                ),
                const MenuComponent(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16.0),
                    child: Row(
                      children: [
                        const Text(
                          "Discover",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => Get.to(() => NewsView()),
                          child: const Text(
                            "Show All",
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (newsController.newsList.isEmpty) {
                    return const NewsSkeltonComponent();
                  } else {
                    return NewsComponents(
                      title: data[0].title,
                      title2: data[1].title,
                      imgUrl: data[0].urlToImage,
                      imgUrl2: data[1].urlToImage,
                      webUrl: data[0].url,
                      webUrl2: data[1].url,
                    );
                  }
                })
              ],
            ),
          ),
          const HeaderHome(),
          Positioned(
              top: 150,
              left: 15,
              child: Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white, // Warna latar belakang
                  borderRadius: BorderRadius.circular(10.0), // Sudut bulat
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Appointment Due in 7 min',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Enter The Waiting Room',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_rounded),
                        label: const Text(''),
                        style: ElevatedButton.styleFrom(
                          alignment: const Alignment(1, 0),
                          padding: EdgeInsets.all(10),
                          backgroundColor: HexColor("#5182F6"),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
