import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/component/card_news_skelton.dart';

class NewsSkeltonComponent extends StatelessWidget {
  const NewsSkeltonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CardNewsSkelton(), Spacer(), CardNewsSkelton()],
      ),
    );
  }
}
