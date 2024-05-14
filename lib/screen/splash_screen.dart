import 'package:final_assignment/screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Adding a Future.delayed to simulate a loading process
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the next page after 2 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginScreen()), // Replace NextPage() with your next page
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.asset('assets/images/logo.png'),
            ),
            const Text(
              "ARTIFY",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(), // Adding a CircularProgressIndicator
          ],
        ),
      ),
    );
  }
}
