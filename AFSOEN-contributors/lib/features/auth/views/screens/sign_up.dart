// import 'package:afsoen/old_arch/providers/auth_provider.dart';
import 'package:afsoen/features/auth/views/screens/log_in.dart';
import 'package:afsoen/features/auth/views/screens/who_are_you.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:afsoen/features/auth/views/widgets/app_input.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUP extends ConsumerStatefulWidget {
  const SignUP({super.key});

  static const routeName = '/sign-up';

  @override
  ConsumerState<SignUP> createState() => _SignUPState();
}

class _SignUPState extends ConsumerState<SignUP> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSending = false;

  void onTap() async {
    final formValidate = _formKey.currentState?.validate();
    if (!formValidate!) return;

    _formKey.currentState?.save();

    if (passwordController.text.toString() != confirmPasswordController.text.toString()) {
      showMessageSnack(context, "Enter the same password");
      return;
    }
    setState(() {
      isSending = true;
    });

    try {
      // await ref.read(authProivder).createAccount(
      //       email: emailController.text.trim(),
      //       password: passwordController.text.trim(),
      //       phone: '+234567890',
      //     );
      // setState(() {
      //   isSending = false;
      // });
      context.push(WhoAreYou.routeName);
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMessageSnack(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showMessageSnack(context, 'The account already exists for that email.');
      } else {
        showMessageSnack(context, e.message.toString());
      }
    } catch (e) {
      showMessageSnack(context, 'Error: $e');
    }
    setState(() {
      isSending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: SizedBox(
          height: deviceHeight(context) * 0.9,
          width: deviceWidth(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: ExtendedImage.asset(
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
                        'Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: deviceHeight(context) * 0.035),
                      ),
                      SizedBox(
                        height: deviceHeight(context) * 0.02,
                      ),
                      AppInput(
                        textController: emailController,
                        title: 'Email',
                        hintText: 'Example@gmail.com',
                        isEmail: true,
                      ),
                      SizedBox(
                        height: deviceHeight(context) * 0.01,
                      ),
                      AppInput(
                        textController: passwordController,
                        title: 'Password',
                        hintText: 'Enter Password',
                        isPassword: true,
                      ),
                      SizedBox(
                        height: deviceHeight(context) * 0.01,
                      ),
                      AppInput(
                        textController: confirmPasswordController,
                        title: 'Confirm Password',
                        hintText: 'Confirm Password',
                        isPassword: true,
                      ),
                      SizedBox(
                        height: deviceHeight(context) * 0.04,
                      ),
                      AppButton(
                        onTap: onTap,
                        placeholder: isSending
                            ? const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : const Text('Sign Up'),
                      ),
                      SizedBox(
                        height: deviceHeight(context) * 0.01,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: 'Already a user? '),
                              TextSpan(text: 'Log in', style: Theme.of(context).textTheme.bodyMedium, recognizer: TapGestureRecognizer()..onTap = () => context.push(Login.routeName)
                                  // recognizer:
                                  )
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
        ),
      ),
    ));
  }
}
