import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/component/button_primary.dart';
import 'package:flutter_application_1/app/modules/home/views/home/home_component.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle linkStyle = const TextStyle(decoration: TextDecoration.underline);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Image.asset(
              'assets/images/introduction.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: HexColor("#5182F6"),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      'Cara simpel untuk berobat',
                      style: TextStyle(
                          fontSize: 22,
                          color: HexColor("#ffffff"),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    children: [
                      PrimaryButton(
                        'Login',
                        onPressed: () {
                          Get.to(() => const Home());
                        },
                      ),
                      PrimaryButton(
                        'Register',
                        onPressed: () {
                          print("Go to Register");
                        },
                      ),
                      const SizedBox(height: 10.0),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: HexColor("#ffffff"),
                            // fontSize: 20.0,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text:
                                  'Dengan login atau membuat akun,\nSaya setuju dengan ',
                            ),
                            TextSpan(
                                text: 'Syarat dan Ketentuan',
                                style: linkStyle,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Terms of Service');
                                  }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
