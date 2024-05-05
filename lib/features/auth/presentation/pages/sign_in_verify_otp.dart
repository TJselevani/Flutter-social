import 'package:flutter/material.dart';
import 'package:social/core/common/logo.dart';
import 'package:social/core/theme/app_pallet.dart';
import 'package:social/features/auth/presentation/widgets/auth_Logo.dart';
import 'package:social/features/auth/presentation/widgets/auth_field.dart';
import 'package:social/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignInVerifyOTPPage extends StatefulWidget {
  const SignInVerifyOTPPage({super.key});

  @override
  State<SignInVerifyOTPPage> createState() => _SignInVerifyOTPPageState();
}

class _SignInVerifyOTPPageState extends State<SignInVerifyOTPPage> {
  bool isSet = false;
  final otpController = TextEditingController();
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
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                 AuthField(hintText: 'OTP code', controller: otpController,),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppPalette.greenColor6,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Back',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const SizedBox(height: 20),
                const AuthGradientButton(name: 'Verify OTP'),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                      text: "Didn't get OTP code ?  ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: "resend",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppPalette.greenColor6,
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
