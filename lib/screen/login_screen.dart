import 'package:final_assignment/commonWidget/my_textform.dart';
import 'package:final_assignment/screen/homepage/dashboard.dart';
import 'package:final_assignment/screen/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final gap = const SizedBox(
    height: 20,
  );
  String? email;
  String? password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.97,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 300,
                      width: double.infinity,
                    ),
                    gap,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    MyTextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        text: "Email"),
                    gap,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    MyTextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        text: "Password"),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget Password?",
                      ),
                    ),
                    gap,
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Implement your authentication logic here
                          if (email == 'admin' && password == 'admin') {
                            // Successful login
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()),
                            );
                          } else {
                            // Invalid credentials
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Invalid email or password')),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    gap,
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    // gap,
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            child: Image.asset(
                              'assets/images/Google.jpg',
                              height: 50,
                              width: 70,
                            ),
                          ),
                          Align(
                              child: Image.asset(
                            'assets/images/Facebook.png',
                            height: 80,
                          )),
                          // Align(
                          //     child: Image.asset(
                          //   'assets/images/Google.jpg',
                          //   height: 50,
                          //   width: 70,
                          // ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
