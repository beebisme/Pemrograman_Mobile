import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/appointment/web_view.dart';
import 'package:flutter_application_1/app/modules/home/views/community/todo_view.dart';
import 'package:flutter_application_1/app/modules/home/views/home/home_menu.dart';
import 'package:flutter_application_1/app/modules/home/views/profile/profile_menu.dart';
import 'package:flutter_application_1/app/modules/home/views/navigation/bottom_navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          const HomeMenu(),
          WebViewApp(),
          const Center(
            child: Text('Tab 3 Content'),
          ),
          TodoView(),
          ProfileMenu()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
