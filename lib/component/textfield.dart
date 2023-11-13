import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Container(
          height: 40,
          width: 230,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(7),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 70, 70, 70),
                offset: Offset(1.5, 1.5),
                blurRadius: 3, // Bayangan
              ),
            ],
          ),
          child: Center(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
