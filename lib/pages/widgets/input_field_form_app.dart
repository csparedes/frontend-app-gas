import 'package:flutter/material.dart';

class InputFieldFormApp extends StatelessWidget {
  const InputFieldFormApp({
    Key? key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.onChange,
    required this.controller,
  }) : super(key: key);

  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType keyboardType;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(children: [
        TextFormField(
          controller: controller,
          onChanged: onChange,
          obscureText: isPassword,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            label: Text(label),
            hintText: hint,
            errorText: errorText,
          ),
        )
      ]),
    );
  }
}
