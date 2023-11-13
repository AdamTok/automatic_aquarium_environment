import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smaq/auth_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const AuthPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Image.asset(
                "lib/image/WhatsApp Image 2023-09-16 at 14.44.45-modified.png",
                height: 200,
                width: 200),
          ),
        ),
      ),
    );
  }
}
