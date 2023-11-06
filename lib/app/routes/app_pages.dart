import 'package:flutter_application_1/app/modules/views/home/home_menu.dart';
import 'package:flutter_application_1/app/modules/views/home_view.dart';
import 'package:flutter_application_1/app/modules/views/login/login_view.dart';
import 'package:flutter_application_1/app/modules/views/news/news_view.dart';
import 'package:flutter_application_1/app/modules/views/register/register_view.dart';
import 'package:flutter_application_1/app/modules/views/webview/news_webview.dart';
import 'package:get/get.dart';

import '../modules/bindings/home_binding.dart';
// import '../modules/home/views/home/home_component.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
        name: _Paths.WELCOME,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeMenu(),
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
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
    ),
  ];
}
