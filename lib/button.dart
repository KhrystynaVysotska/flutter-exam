import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: IconButton(
          icon: const Icon(
            Icons.circle,
            color: Colors.red,
            size: 40.0,
          ),
          onPressed: onPressed,
      ),
    );
  }
}
