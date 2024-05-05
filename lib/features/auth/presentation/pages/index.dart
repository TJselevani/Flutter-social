import 'package:flutter/material.dart';
import 'package:social/core/common/logo.dart';
import 'package:social/core/theme/app_pallet.dart';
import 'package:social/features/auth/presentation/widgets/auth_logo.dart';
import 'package:social/features/auth/presentation/widgets/auth_normal_button.dart';

class AuthIndexPage extends StatelessWidget {
  const AuthIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Center(
                  child: Hero(
                    tag: Logo.audioVisualRBG,
                    child: AuthLogo(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Experience \n",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(),
                      children: [
                        TextSpan(
                          text: "  Audio \n",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppPalette.greenColor5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 33,
                                  ),
                          children: [
                            TextSpan(
                              text: "    Visual ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppPalette.greenColor5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 33,
                                  ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Hero(
                    tag: "AuthButton",
                    child: AuthNormalButton(
                      name: 'Get Started',
                      index: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
