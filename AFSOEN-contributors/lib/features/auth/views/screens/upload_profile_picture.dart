import 'package:afsoen/features/auth/views/screens/all_done.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:afsoen/features/auth/views/widgets/reg_icon_text.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UploadProfilePicture extends StatelessWidget {
  const UploadProfilePicture({super.key});

  static const routeName = '/profile-picture';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegistrationTitle(
              regTitle: "Upload your profile picture",
              navigateTo: () => context.pop(),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 5, color: AppColor.orangeColor), borderRadius: BorderRadius.circular(100)),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            AppButton(
              onTap: () {
                context.push(FinalRegistrationScreen.routeName);
              },
              placeholder: Text(
                "UPLOAD",
                style: TextStyle(color: AppColor.whiteColor, fontSize: deviceWidth(context) * 0.04, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
