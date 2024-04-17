import 'package:afsoen/features/auth/views/screens/sign_up.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:afsoen/features/auth/views/widgets/app_input.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static const routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: deviceHeight(context) * 0.9,
        width: deviceWidth(context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: deviceWidth(context) * 0.3,
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: deviceHeight(context) * 0.04,
                  ),
                  Text(
                    'Log In',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: deviceHeight(context) * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.02,
                  ),
                  AppInput(
                    textController: TextEditingController(),
                    title: 'Email',
                    hintText: 'Example@gmail.com',
                    isEmail: true,
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.01,
                  ),
                  AppInput(
                    textController: TextEditingController(),
                    title: 'Password',
                    hintText: 'Enter Password',
                    isPassword: true,
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.04,
                  ),
                  AppButton(
                    onTap: () {},
                    placeholder: const Text('Log In'),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.01,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Don\'t have an account? '),
                          TextSpan(
                            text: 'Sign up',
                            style: Theme.of(context).textTheme.bodyMedium,
                            recognizer: TapGestureRecognizer()..onTap = () => context.push(SignUP.routeName),
                            // recognizer:
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
