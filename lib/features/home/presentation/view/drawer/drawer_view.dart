import 'package:final_assignment/core/common/provider/theme_provider.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerView extends ConsumerStatefulWidget {
  const DrawerView({super.key});

  @override
  ConsumerState<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends ConsumerState<DrawerView> {
  late bool isDark;
  @override
  void initState() {
    // isDark = ref.read(isDarkThemeProvider);
    isDark = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text("John Doe"),
            accountEmail: const Text("johndoe@example.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 78, 6, 125),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.black,
              size: 30,
            ),
            title: const Text(
              'Profile',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigate to profile screen
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
            title: const Text(
              'Settings',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigate to settings screen
            },
          ),
          ListTile(
            leading: Switch(
                value: ref.read(themeViewModelProvider),
                onChanged: (value) {
                  ref.read(themeViewModelProvider.notifier).changeTheme();
                }),
            title: const Text(
              'Mode',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              ref.read(homeViewModelProvider.notifier).logout();
              // Handle logout
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.black,
              size: 30,
            ),
            title: const Text(
              'Logout',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              ref.read(homeViewModelProvider.notifier).logout();
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
