import 'dart:async';

import 'package:final_assignment/features/auth/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    startLoading();
  }

  void startLoading() {
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        if (_progressValue >= 1.0) {
          timer.cancel();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          _progressValue += 0.01;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.97,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 300,
                  width: double.infinity,
                ),
                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: _progressValue,
                  color: Colors.orange,
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
