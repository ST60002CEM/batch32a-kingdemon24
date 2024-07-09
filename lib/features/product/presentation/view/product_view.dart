// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ProductView extends ConsumerStatefulWidget {
//   const ProductView({super.key});

//   @override
//   ConsumerState<ProductView> createState() => _ProductViewState();
// }

// class _ProductViewState extends ConsumerState<ProductView> {
//   int _selectedIndex = 0;

//   static const List<Widget> _widgetOptions = <Widget>[
//     Center(child: Text('Home')),
//     Center(child: Text('Pictures')),
//     Center(child: Text('Saved')),
//     Center(child: Text('Profile')),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Dashboard'),
//         ),
//         body: _widgetOptions.elementAt(_selectedIndex),
//         bottomNavigationBar: BottomNavigationBar(
//           selectedIconTheme: const IconThemeData(color: Colors.purple),
//           unselectedIconTheme: const IconThemeData(color: Colors.black),
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.category),
//               label: 'Pictures',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.bookmark),
//               label: 'Saved',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.purple,
//           onTap: _onItemTapped,
//         ),
//       ),
//     );
//   }
// }
