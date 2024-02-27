import 'package:flutter/material.dart';

class OneTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const OneTextField({
    super.key,
    required this.validator,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.keyboardType,
  });

  @override
  State<OneTextField> createState() => _OneTextFieldState();
}

class _OneTextFieldState extends State<OneTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 233, 233, 233))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 233, 233, 233))),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          suffixIcon: widget.controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => widget.controller.clear(),
                ),
        ),
      ),
    );
  }
}
