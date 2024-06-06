import 'package:final_assignment/features/auth/presentation/widgets/my_textform.dart';
import 'package:final_assignment/features/auth/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

const gap = SizedBox(
  height: 20,
);

class _RegisterScreenState extends State<RegisterScreen> {
  String? fname;
  String? lname;
  String? email;
  String? password;
  String? cpassword;
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
                      height: 200,
                      width: double.infinity,
                    ),
                    gap,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "First Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    MyTextFormField(
                        onChanged: (value) {
                          fname = value;
                        },
                        text: "First Name"),
                    gap,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Last Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    MyTextFormField(
                        onChanged: (value) {
                          lname = value;
                        },
                        text: "Last Name"),
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
                    gap,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Confirm password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      onChanged: (value) {
                        setState(() {
                          cpassword = value;
                        });
                      },
                      // text: "Confirm Password",
                      // obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    gap,
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Your Account successfully created'),
                              backgroundColor:
                                  Colors.green, // Set background color to green
                              behavior: SnackBarBehavior
                                  .fixed, // Set behavior to floating
                            ),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ))
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
