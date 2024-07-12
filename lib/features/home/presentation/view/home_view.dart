
import 'dart:async';

import 'package:all_sensors/all_sensors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_assignment/core/common/my_snakbar.dart';
import 'package:final_assignment/features/connectivity.dart';
import 'package:final_assignment/features/home/presentation/view/product_view.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:final_assignment/features/profile/presentation/view/profile_view.dart';

import 'package:final_assignment/features/home/presentation/view/product_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    // const ProductView(),
    const ProductView(),

    const InternetCheckView(),
    const ProfileView(),

    // const Center(child: Text('Home')),
    const Center(child: Text('Pictures')),
    const Center(child: Text('Pictures')),
    const Center(child: Text('Saved')),
    const Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isToggled = false; // Added toggle state variable
  bool showYesNoDialog = true;
  bool isDialogShowing = false;

  List<double> _gyroscopeValues = [];
  final List<StreamSubscription<dynamic>> _streamSubscription = [];

  @override
  void initState() {
    // _loadUserId();
    // _scrollController.addListener(_onScroll);
    _streamSubscription.add(gyroscopeEvents!.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];

        _checkGyroscopeValues(_gyroscopeValues);
      });
    }));

    super.initState();
  }

  void _checkGyroscopeValues(List<double> values) async {
    const double threshold = 0.5; // Example threshold value, adjust as needed
    if (values.any((value) => value.abs() > threshold)) {
      if (showYesNoDialog && !isDialogShowing) {
        isDialogShowing = true;
        final result = await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Logout',
          desc: 'Are You Sure You Want To Logout?',
          btnOkOnPress: () {
            ref.read(homeViewModelProvider.notifier).logout();
          },
          btnCancelOnPress: () {},
        ).show();

        isDialogShowing = false;
        if (result) {
          showMySnackBar(
            message: 'Logged Out Successfully!',
            color: Colors.green,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.purple),
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Pictures',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
