import 'package:final_assignment/screen/homepage/homepage_screen.dart';
import 'package:final_assignment/screen/login_screen.dart';
import 'package:final_assignment/screen/register_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    const HomePageScreen(),
    const HomePageScreen(),
    const LoginScreen(),
    // const AboutUsScreen(),
    const RegisterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text("hello")),
        body: lstBottomScreen[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarItem.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            // BottomNavigationBarItem(icon: Icon(Icons.info), label: "About Us"),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility_new_outlined), label: "Tapme")
          ],
          backgroundColor: Colors.amber,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,

          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
