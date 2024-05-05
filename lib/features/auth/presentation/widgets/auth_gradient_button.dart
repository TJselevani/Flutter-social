import 'package:flutter/material.dart';
import 'package:social/core/theme/app_pallet.dart';

class AuthGradientButton extends StatefulWidget {
  final String name;
  const AuthGradientButton({super.key, required this.name});

  @override
  State<AuthGradientButton> createState() => _AuthGradientButtonState();
}

class _AuthGradientButtonState extends State<AuthGradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [AppPalette.greenColor4, AppPalette.greenColor5],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
          borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 55),
          backgroundColor: AppPalette.transparent,
          shadowColor: AppPalette.transparent,
        ),
        child: Text(
          widget.name,
          style: const TextStyle(
              color: AppPalette.greenColor6,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
