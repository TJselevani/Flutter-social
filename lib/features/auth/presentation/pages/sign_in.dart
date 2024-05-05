import 'package:flutter/material.dart';
import 'package:social/core/common/logo.dart';
import 'package:social/core/theme/app_pallet.dart';
import 'package:social/features/auth/presentation/pages/sign_in_otp.dart';
import 'package:social/features/auth/presentation/pages/sign_up.dart';
import 'package:social/features/auth/presentation/widgets/auth_Logo.dart';
import 'package:social/features/auth/presentation/widgets/auth_field.dart';
import 'package:social/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: ((context) => const SignUpPage()),
      );
  static otp() => MaterialPageRoute(
        builder: (context) => const SignInOTPPage(),
      );
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalette.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Hero(
                  tag: Logo.audioVisualRBG,
                  child: AuthLogo(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sign In.',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                AuthField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'Password',
                  controller: passwordController,
                  isObscureText: true,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'OTP Sign in',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          SignInPage.otp(),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppPalette.greenColor6,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Hero(
                  tag: "AuthButton",
                  child: AuthGradientButton(name: 'Sign In'),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      SignInPage.route(),
                    ),
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "Don't have an account?  ",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppPalette.greenColor6,
                                  fontWeight: FontWeight.bold,
                                ),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
