// import 'package:afsoen/old_arch/providers/auth_provider.dart';
import 'package:afsoen/features/dashboard/views/screens/bottom_nav_bar.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinalRegistrationScreen extends ConsumerStatefulWidget {
  const FinalRegistrationScreen({super.key});
  static const routeName = "/all-done";
  @override
  ConsumerState<FinalRegistrationScreen> createState() => _FinalRegistrationScreenState();
}

class _FinalRegistrationScreenState extends ConsumerState<FinalRegistrationScreen> {
  bool isSending = false;
  void onTap() async {
    setState(() {
      isSending = true;
    });
    try {
      // await ref.read(authProivder).setupUser();
      context.push(Menu.routeName);
    } catch (e) {
      showMessageSnack(context, e.toString());
    }

    setState(() {
      isSending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final finalPage = context.goNamed("/all-done");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1.0,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.chevron_left_outlined,
                        color: Colors.orange,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      width: deviceWidth(context) * 0.9,
                      child: Column(children: [
                        const Text(
                          "WE ARE ALL DONE",
                          style: TextStyle(color: AppColor.whiteColor, fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          width: deviceWidth(context) * 1,
                        ),
                        const Text(
                          "WELCOME",
                          style: TextStyle(color: AppColor.whiteColor, fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AppButton(
              onTap: onTap,
              placeholder: isSending
                  ? const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Text(
                      "Create your Profile",
                      style: TextStyle(color: AppColor.whiteColor, fontSize: deviceWidth(context) * 0.04, fontWeight: FontWeight.bold),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
