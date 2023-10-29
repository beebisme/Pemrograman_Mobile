import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [HexColor("#5869ff"), HexColor("#46a4f9")], // Warna gradient
          begin: Alignment.topLeft, // Posisi awal gradient
          end: Alignment.bottomRight, // Posisi akhir gradient
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello,",
                style: TextStyle(
                    color: HexColor("#ffffff"),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.markunread_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Row(
            children: [
              Text(
                'Tanis Alhariroh',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                " 👋",
                style: TextStyle(fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}
