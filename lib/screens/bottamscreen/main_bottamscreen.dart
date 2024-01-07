import 'package:flutter/material.dart';

import '../foodscreen.dart';
import '../homescreen.dart';
import '../profilescreen.dart';

class MainBottamScreen extends StatefulWidget {
  const MainBottamScreen({super.key});

  @override
  State<MainBottamScreen> createState() => _MainBottamScreenState();
}

class _MainBottamScreenState extends State<MainBottamScreen> {
  int pageIndex = 0;
  List<AppBar> appBarList = [
    AppBar(
      title: const Text('HOME'),
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
    ),
    AppBar(
      title: const Text('FOOD'),
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
    ),
    AppBar(
      title: const Text('PROFILE'),
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
    ),
  ];
  final List tabList = [
    const MyHomeScreen(),
    const MyStudentScreen(),
    const MyProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarList[pageIndex],
      body: Stack(
        children: [
          tabList.elementAt(pageIndex),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: const Alignment(0, 1),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.black,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.deepPurple.shade200,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  currentIndex: pageIndex,
                  onTap: (int index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.food_bank),
                      label: 'Food',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'profile',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
