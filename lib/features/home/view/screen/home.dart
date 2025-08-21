import 'package:api_app/features/home/view/screen/fakeStore_screen.dart';
import 'package:api_app/features/home/view/screen/labtop_screen.dart';
import 'package:api_app/features/home/view/screen/login_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> screen = [LabtopScreen(), FakestoreScreen(), LoginScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop_windows),
            label: "laptop store",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new_sharp),
            label: "Fake closes store",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
      body: screen[currentIndex],
    );
  }
}
