import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_rounded),
          label: 'Appointments',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.markunread_outlined),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups_3_rounded),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: HexColor("#5869ff"),
      unselectedItemColor: Colors.grey.shade600,
      onTap: onItemTapped,
      showUnselectedLabels: false,
      showSelectedLabels: true,
    );
  }
}
