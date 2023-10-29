import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MenuComponent extends StatelessWidget {
  const MenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InkWell(
            //   onTap: () {
            //     // To another page
            //   },
            //   child: Container(
            //     width: 170.0,
            //     height: 180.0,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       // gradient: LinearGradient(
            //       //   colors: [
            //       //     HexColor("#5869ff"),
            //       //     HexColor("#46a4f9")
            //       //   ], // Warna gradient
            //       //   begin: Alignment.topLeft, // Posisi awal gradient
            //       //   end: Alignment.bottomRight, // Posisi akhir gradient
            //       // ),
            //       borderRadius: BorderRadius.circular(10.0),
            //       boxShadow: const [
            //         BoxShadow(
            //           color: Colors.grey, // Warna bayangan
            //           offset: Offset(0, 2), // Posisi bayangan
            //           blurRadius: 4.0, // Radius blur
            //           spreadRadius: 1.0, // Meratakan bayangan
            //         ),
            //       ],
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(12.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: <Widget>[
            //           Icon(
            //             Icons.calendar_month_rounded,
            //             size: 50.0,
            //             color: HexColor("#000000"),
            //           ),
            //           const SizedBox(
            //               height: 10.0), // Spasi antara ikon dan judul
            //           const Text(
            //             'Book an Appoinment',
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 18.0,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           const Text(
            //             'With a GP or nurse',
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 16.0,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
                // To another page
              },
              child: Container(
                width: 170.0,
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, // Warna bayangan
                      offset: Offset(0, 2), // Posisi bayangan
                      blurRadius: 4.0, // Radius blur
                      spreadRadius: 1.0, // Meratakan bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              HexColor("##5869ff"),
                              HexColor("#46a4f9")
                            ], // Warna gradient
                            begin: Alignment.topLeft, // Posisi awal gradient
                            end: Alignment.bottomRight, // Posisi akhir gradient
                          ).createShader(bounds);
                        },
                        child: const Icon(
                          Icons.calendar_month_rounded,
                          size: 50.0,
                          color: Colors
                              .white, // Warna ikon akan diganti dengan gradient
                        ),
                      ),
                      const SizedBox(
                          height: 10.0), // Spasi antara ikon dan judul
                      const Text(
                        'Book an Appoinment',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'With a GP or nurse',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                // To another page
              },
              child: Container(
                width: 170.0,
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, // Warna bayangan
                      offset: Offset(0, 2), // Posisi bayangan
                      blurRadius: 4.0, // Radius blur
                      spreadRadius: 1.0, // Meratakan bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              HexColor("##5869ff"),
                              HexColor("#46a4f9")
                            ], // Warna gradient
                            begin: Alignment.topLeft, // Posisi awal gradient
                            end: Alignment.bottomRight, // Posisi akhir gradient
                          ).createShader(bounds);
                        },
                        child: const Icon(
                          Icons.note_alt_rounded,
                          size: 50.0,
                          color: Colors
                              .white, // Warna ikon akan diganti dengan gradient
                        ),
                      ),
                      const SizedBox(
                          height: 10.0), // Spasi antara ikon dan judul
                      const Text(
                        'Request a Prescription',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'We am for someday service',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                // To another page
              },
              child: Container(
                width: 170.0,
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, // Warna bayangan
                      offset: Offset(0, 2), // Posisi bayangan
                      blurRadius: 4.0, // Radius blur
                      spreadRadius: 1.0, // Meratakan bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              HexColor("##5869ff"),
                              HexColor("#46a4f9")
                            ], // Warna gradient
                            begin: Alignment.topLeft, // Posisi awal gradient
                            end: Alignment.bottomRight, // Posisi akhir gradient
                          ).createShader(bounds);
                        },
                        child: const Icon(
                          Icons.note_add_rounded,
                          size: 50.0,
                          color: Colors
                              .white, // Warna ikon akan diganti dengan gradient
                        ),
                      ),
                      const SizedBox(
                          height: 10.0), // Spasi antara ikon dan judul
                      const Text(
                        'Administration Request',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Requested for Sick notes',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                // To another page
              },
              child: Container(
                width: 170.0,
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, // Warna bayangan
                      offset: Offset(0, 2), // Posisi bayangan
                      blurRadius: 4.0, // Radius blur
                      spreadRadius: 1.0, // Meratakan bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              HexColor("##5869ff"),
                              HexColor("#46a4f9")
                            ], // Warna gradient
                            begin: Alignment.topLeft, // Posisi awal gradient
                            end: Alignment.bottomRight, // Posisi akhir gradient
                          ).createShader(bounds);
                        },
                        child: const Icon(
                          Icons.notification_add_sharp,
                          size: 50.0,
                          color: Colors
                              .white, // Warna ikon akan diganti dengan gradient
                        ),
                      ),
                      const SizedBox(
                          height: 10.0), // Spasi antara ikon dan judul
                      const Text(
                        'Messages & Notifications',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'How we contact you',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
