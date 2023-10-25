import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.hint,
    required this.obscure,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
    );
  }
}
