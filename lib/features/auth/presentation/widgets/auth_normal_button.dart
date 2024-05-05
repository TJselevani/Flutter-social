import 'package:flutter/material.dart';
import 'package:social/core/theme/app_pallet.dart';
import 'package:social/features/auth/presentation/pages/sign_in.dart';
import 'package:social/features/auth/presentation/pages/sign_up.dart';

class AuthNormalButton extends StatefulWidget {
  final int index;
  final String name;
  const AuthNormalButton({super.key, required this.name, required this.index});

  @override
  State<AuthNormalButton> createState() => _AuthNormalButtonState();
}

class _AuthNormalButtonState extends State<AuthNormalButton> {
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
        onPressed: () => {
          widget.index == 1
              ? Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                )
              : Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                )
        },
        style: ElevatedButton.styleFrom(
          // fixedSize: const Size(300, 55),
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
