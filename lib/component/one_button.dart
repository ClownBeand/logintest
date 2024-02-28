import 'package:flutter/material.dart';

class OneButton extends StatelessWidget {
  final String text;
  // final VoidCallback onClicked;
  void Function()? onTap;

  OneButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFF2796B),
        ),
        child: const Center(
            child: Text(
          "Sign in",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        )),
      ),
    );
  }
}
