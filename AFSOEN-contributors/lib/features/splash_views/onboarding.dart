import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:afsoen/features/auth/views/screens/sign_up.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  static const routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: deviceHeight(context) * 0.01,
          bottom: deviceHeight(context) * 0.03,
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(deviceHeight(context) * 0.01),
                child: ExtendedImage.asset('assets/images/splash.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: deviceWidth(context) * 0.05,
                vertical: deviceHeight(context) * 0.1,
              ),
              child: Text.rich(
                TextSpan(
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: deviceHeight(context) * 0.025, fontWeight: FontWeight.bold, color: AppColor.orangeColor),
                  children: [
                    const TextSpan(
                      text: 'The No 1 ',
                    ),
                    TextSpan(
                      text: 'Social Media ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const TextSpan(
                      text: 'App To ',
                    ),
                    TextSpan(
                      text: 'Monetize Your Content',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceHeight(context) * 0.04),
              child: AppButton(
                onTap: () {
                  context.go(SignUP.routeName);
                },
                placeholder: Text(
                  "Next",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: deviceHeight(context) * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
