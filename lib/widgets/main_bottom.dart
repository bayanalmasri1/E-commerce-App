// ignore_for_file: library_private_types_in_public_api

import 'package:ecommerceapp/views/home/ads_screen.dart';
import 'package:ecommerceapp/views/home/home_screen.dart';
import 'package:ecommerceapp/views/home/notfication_screen.dart';
import 'package:ecommerceapp/views/home/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(), // الصفحة الرئيسية
   ListingsScreen(), // صفحة الفئات
    NotificationsScreen(), // صفحة الإشعارات
    AccountSettingsScreen(), // صفحة الإعدادات
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, // تبقى الصفحة نشطة عند التبديل
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed('/add');
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.teal,
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home,
                  color: _selectedIndex == 0 ? Colors.orange : Colors.white,
                  size: 35),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.category,
                  color: _selectedIndex == 1 ? Colors.orange : Colors.white,
                  size: 35),
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 40), // مساحة لزر الـ FAB
            IconButton(
              icon: Icon(Icons.notifications,
                  color: _selectedIndex == 2 ? Colors.orange : Colors.white,
                  size: 35),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.person,
                  color: _selectedIndex == 3 ? Colors.orange : Colors.white,
                  size: 35),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
