import 'package:afsoen/features/auth/views/screens/upload_profile_picture.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:afsoen/features/auth/views/widgets/gender_item.dart';
import 'package:afsoen/features/auth/views/widgets/reg_icon_text.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:go_router/go_router.dart';

class ChooseGender extends StatelessWidget {
  const ChooseGender({super.key});

  static const routeName = '/gender';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegistrationTitle(navigateTo: () => context.pop(), regTitle: "Select your Gender"),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: deviceWidth(context) * 1,
              height: deviceHeight(context) * 0.5,
              child: const GenderItem(),
            ),
            AppButton(
                onTap: () {
                  context.push(UploadProfilePicture.routeName);
                },
                placeholder: const Text(
                  "Continue",
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
