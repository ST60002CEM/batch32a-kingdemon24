import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[100], title: const Text("DashBoard")),
      body: const Center(child: Text("homePage")),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [],
      // ),
    );
  }
}
