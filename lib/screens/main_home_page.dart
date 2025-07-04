import 'package:flutter/material.dart';
import 'package:zuv_delivery_driver/screens/bottom_screens/delivery_detail.dart';
import 'package:zuv_delivery_driver/screens/bottom_screens/home_page.dart';
import 'package:zuv_delivery_driver/screens/bottom_screens/login_page.dart';
import 'package:zuv_delivery_driver/screens/bottom_screens/my_page.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = [
    HomePage(),
    Home2page(),
    DeliveriesDetailScreen(),
    LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: widgetOptions.elementAt(_selectedIndex),
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: true,
      //   showUnselectedLabels: true,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.amber,
      //   unselectedItemColor: Colors.blueGrey,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Deliveries'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Home'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Delivery Detail',
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Login'),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
