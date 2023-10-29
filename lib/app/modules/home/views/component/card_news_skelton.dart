import 'package:flutter/material.dart';

class CardNewsSkelton extends StatelessWidget {
  const CardNewsSkelton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(6)),
            ),
            const SizedBox(
              height: 8,
            ),
            const Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Skelton(
                  height: 8,
                  width: 150,
                ),
                SizedBox(
                  height: 8,
                ),
                Skelton(
                  height: 8,
                  width: 110,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(10)),
    );
  }
}
