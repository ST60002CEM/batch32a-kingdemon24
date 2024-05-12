import 'package:final_assignment/screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Adding a Future.delayed to simulate a loading process
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next page after 2 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()), // Replace NextPage() with your next page
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "ARTIFY",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(), // Adding a CircularProgressIndicator
          ],
        ),
      ),
    );
  }
}
