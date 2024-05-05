import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social/core/common/logo.dart';
import 'package:social/core/theme/app_pallet.dart';
import 'package:social/features/auth/presentation/widgets/auth_Logo.dart';
import 'package:social/features/auth/presentation/widgets/auth_field.dart';
import 'package:social/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                'Sign Up.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const AuthField(hintText: 'Name'),
              const SizedBox(height: 15),
              const AuthField(hintText: 'Email'),
              const SizedBox(height: 15),
              const AuthField(hintText: 'Password'),
              const SizedBox(height: 15),
              const SizedBox(height: 20),
              const AuthGradientButton(name: 'Sign Up'),
              const SizedBox(height: 25),
              RichText(
                text: TextSpan(
                    text: "Already have an account ?  ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Sign In",
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
    );
  }
}
