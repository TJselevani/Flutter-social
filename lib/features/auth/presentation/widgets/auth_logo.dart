import 'package:flutter/material.dart';
import 'package:social/core/common/logo.dart';
import 'package:social/core/theme/app_pallet.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(AppPalette.greenColor5,
            BlendMode.srcIn), // Change the color to your desired color
        child: Image.asset(
          Logo.audioVisualRBG,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
