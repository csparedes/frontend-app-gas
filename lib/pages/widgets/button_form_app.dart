import 'package:flutter/material.dart';

class ButtonFormApp extends StatelessWidget {
  const ButtonFormApp({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        height: 60,
        minWidth: double.infinity,
        child: Text(
          label,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
