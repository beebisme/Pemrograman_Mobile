import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:flutter_application_1/app/modules/home/views/news/news_view.dart';
import 'package:flutter_application_1/app/modules/home/views/webview/news_webview.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
// import '../modules/home/views/home/home_component.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => NewsView(),
    ),
    GetPage(
      name: _Paths.NEWSWEBVIEW,
      page: () => const NewsWebView(
        url: "https://www.youtube.com/",
      ),
    ),
  ];
}
