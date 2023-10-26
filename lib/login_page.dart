import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smaq/component/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    child: Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Icon(
                              Icons.lock,
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Login terlebih dahulu....",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.62,
                    height: MediaQuery.of(context).size.width * 0.62,
                    margin: const EdgeInsets.only(top: 100, right: 10),
                    child: Image.asset(
                      "lib/image/WhatsApp Image 2023-09-16 at 14.44.45-modified.png",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                      controller: _emailController,
                      hintText: 'Masukkan e-mail anda',
                      obscureText: false),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                      controller: _passwordController,
                      hintText: 'Masukkan password anda',
                      obscureText: true),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      logIn();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.4,
                        vertical: 20,
                      ),
                      backgroundColor: const Color.fromARGB(255, 71, 181, 209),
                      shadowColor: const Color.fromARGB(255, 71, 181, 209),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height:
                        15, // Mengurangi tinggi ini agar tampilan lebih baik di layar besar
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Klik untuk login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
