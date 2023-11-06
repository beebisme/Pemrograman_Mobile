import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscoverComponent extends StatelessWidget {
  const DiscoverComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 170.0,
            height: 280.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  HexColor("#5869ff"),
                  HexColor("#46a4f9")
                ], // Warna gradient
                begin: Alignment.topLeft, // Posisi awal gradient
                end: Alignment.bottomRight, // Posisi akhir gradient
              ),
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
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    // To another page
                  },
                  child: Container(
                    width: 170.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 4),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/images/dicover_oneCropted.png',
                          width: 180.0,
                          height: 180.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Coronavirus - World Health Organization',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        const SizedBox(
          width: 10.0,
        ),
        // Item 2
        InkWell(
          onTap: () {
            // To another page
          },
          child: Container(
              width: 170.0,
              height: 280.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    HexColor("#5869ff"),
                    HexColor("#46a4f9")
                  ], // Warna gradient
                  begin: Alignment.topLeft, // Posisi awal gradient
                  end: Alignment.bottomRight, // Posisi akhir gradient
                ),
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
              child: Stack(
                children: [
                  Container(
                    width: 170.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 4),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            'assets/images/wash_hand_discover_cropted.png',
                            width: 180.0,
                            height: 180.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Wash Your Hand Using Soap',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
