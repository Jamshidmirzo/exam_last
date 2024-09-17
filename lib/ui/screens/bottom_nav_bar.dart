import 'package:exam_last/ui/screens/add_payments_screen.dart';
import 'package:exam_last/ui/screens/home_screen.dart';
import 'package:exam_last/ui/screens/daromad_screen.dart';
import 'package:exam_last/ui/screens/savings_screen.dart';
import 'package:exam_last/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  List screens = [
    const HomeScreen(),
    const SavingsScreen(),
    AddPaymentsScreen(),
     NotificationsScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.task,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: ''),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
