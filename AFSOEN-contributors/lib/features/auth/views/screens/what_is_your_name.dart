// import 'package:afsoen/old_arch/providers/auth_provider.dart';
import 'package:afsoen/features/auth/views/screens/date_of_birth.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:afsoen/features/auth/views/widgets/app_input.dart';
import 'package:afsoen/features/auth/views/widgets/reg_icon_text.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WhatIsYourName extends ConsumerStatefulWidget {
  const WhatIsYourName({super.key});

  static const routeName = '/what-is-your-name';

  @override
  ConsumerState<WhatIsYourName> createState() => _WhatIsYourNameState();
}

class _WhatIsYourNameState extends ConsumerState<WhatIsYourName> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  void onTap() {
    final formValidate = _formKey.currentState?.validate();

    if (!formValidate!) return;
    _formKey.currentState?.save();
    // ref.read(authProivder).getUserName
    (firstName: firstNameController.text.trim(), 
    lastName: lastNameController.text.trim());
    context.push(DateOfBirth.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                RegistrationTitle(
                  regTitle: "What is your name?",
                  navigateTo: () => context.pop(),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: deviceWidth(context) * 0.9,
                  height: deviceHeight(context) * 0.5,
                  child: Column(
                    children: [
                      AppInput(textController: firstNameController, title: 'First Name', hintText: 'Enter your first name'),
                      const SizedBox(
                        height: 20,
                      ),
                      AppInput(textController: lastNameController, title: 'Last Name', hintText: 'Enter Your Last Name'),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: RichText(
                          // textAlign: TextAlign.center,
                          text: const TextSpan(style: TextStyle(fontSize: 16, letterSpacing: 3), children: [
                            TextSpan(text: "By tapping Sign Up & Accept, you acknowledge that you have read the "),
                            TextSpan(text: "Privacy Policy ", style: TextStyle(color: AppColor.orangeColor)),
                            TextSpan(text: "and agree to the "),
                            TextSpan(text: "Terms of Service", style: TextStyle(color: AppColor.orangeColor))
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                AppButton(
                    onTap: onTap,
                    placeholder: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                AppButton(
                    onTap: () {
                      context.push(DateOfBirth.routeName);
                    },
                    placeholder: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
