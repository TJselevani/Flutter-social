import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final bool isObscureText;
  final TextEditingController controller;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "${widget.hintText} is required";
        }
        return null;
      },
      obscureText: widget.isObscureText,
    );
  }
}
