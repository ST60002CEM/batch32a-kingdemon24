import 'package:final_assignment/app/navigator_key/navigator_key.dart';
import 'package:final_assignment/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';

import '../screen/theme/theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: const SplashScreen(),
    );
  }
}
