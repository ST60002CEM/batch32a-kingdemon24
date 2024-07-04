import 'package:final_assignment/app/navigator_key/navigator_key.dart';
import 'package:final_assignment/app/theme/app_theme.dart';
import 'package:final_assignment/core/common/provider/theme_provider.dart';
import 'package:final_assignment/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isDarkTheme = ref.watch(themeViewModelProvider);
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getApplicationTheme(isDarkTheme),
      home: const SplashScreen(),
    );
  }
}
