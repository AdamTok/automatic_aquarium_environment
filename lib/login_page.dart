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
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          backgroundColor: Colors.red,
          content: SizedBox(
            height: 30,
            child: Center(
                child: Container(
              padding: const EdgeInsets.only(top: 10, left: 47),
              child: const Row(
                children: [
                  Text(
                    'Periksa kembali Email dan Password anda',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.announcement_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            )),
          ),
          duration: const Duration(
              milliseconds: 1500), // Durasi tampilan SnackBar (3 detik)
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          backgroundColor: Colors.red,
          content: SizedBox(
            height: 30,
            child: Center(
                child: Container(
              padding: const EdgeInsets.only(top: 10, left: 47),
              child: const Row(
                children: [
                  Text(
                    'Terjadi Kesalahan dalam Autentikasi  ',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.announcement_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            )),
          ),
          duration: const Duration(
              milliseconds: 1500), // Durasi tampilan SnackBar (3 detik)
        ),
      );
    }
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
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.52,
                    height: MediaQuery.of(context).size.width * 0.52,
                    margin: const EdgeInsets.only(top: 100, right: 10),
                    child: Image.asset(
                      "lib/image/WhatsApp Image 2023-09-16 at 14.44.45-modified.png",
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 320,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 97, 183, 254),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 142, 142, 142),
                          offset: Offset(4, 6),
                          blurRadius: 3, // Bayangan
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MyTextField(
                                controller: _emailController,
                                hintText: 'Masukkan e-mail anda',
                                obscureText: false),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MyTextField(
                                controller: _passwordController,
                                hintText: 'Masukkan password anda',
                                obscureText: true),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            logIn();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.27,
                              vertical: 10,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 40, 108, 126),
                            shadowColor: const Color.fromARGB(255, 18, 66, 78),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Icon(
                            Icons.login,
                            color: Colors.white,
                            size: 23,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
