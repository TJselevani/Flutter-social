import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  const AuthField({super.key, required this.hintText});

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
    );
  }
}
