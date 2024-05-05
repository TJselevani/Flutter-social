import 'package:flutter/material.dart';
import 'package:social/core/common/logo.dart';
import 'package:social/core/theme/app_pallet.dart';
import 'package:social/features/auth/presentation/pages/sign_in.dart';
import 'package:social/features/auth/presentation/pages/sign_in_verify_otp.dart';
import 'package:social/features/auth/presentation/widgets/auth_Logo.dart';
import 'package:social/features/auth/presentation/widgets/auth_field.dart';
import 'package:social/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignInOTPPage extends StatefulWidget {
  const SignInOTPPage({super.key});

  @override
  State<SignInOTPPage> createState() => _SignInOTPPageState();
}

class _SignInOTPPageState extends State<SignInOTPPage> {
  bool isSet = false;
  final phoneController = TextEditingController();
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
          // margin: const EdgeInsets.only(top: 170),
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
                  'OTP Sign In.',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                AuthField(
                  hintText: 'Phone Number',
                  controller: phoneController,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppPalette.greenColor6,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Email Sign in',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInVerifyOTPPage()),
                    )
                  },
                  child: const Hero(
                    tag: "AuthButton",
                    child: AuthGradientButton(name: 'Get OTP'),
                  ),
                ),
                const SizedBox(height: 25),
                // RichText(
                //   text: TextSpan(
                //       text: "Didn't get OTP code ?  ",
                //       style: Theme.of(context).textTheme.titleMedium,
                //       children: [
                //         TextSpan(
                //           text: "resend",
                //           style:
                //               Theme.of(context).textTheme.titleMedium?.copyWith(
                //                     color: AppPalette.greenColor6,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //         )
                //       ]),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
