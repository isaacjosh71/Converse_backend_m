import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UploadReelsContent extends StatelessWidget {
  static const routeName = "/upload-reels-content";
  const UploadReelsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.only(top: deviceHeight(context) * 0.05),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.topLeft, children: [
                  GestureDetector(
                    onTap: () => GoRouter.of(context).pop(),
                    child: const Icon(
                      Icons.cancel_outlined,
                      color: AppColor.orangeColor,
                      size: 40,
                    ),
                  ),
                ]),
                SizedBox(
                  width: deviceWidth(context),
                  height: deviceHeight(context) * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "This is the beginning of something great",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColor.whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: deviceHeight(context) * 0.1,
                      ),
                      AppButton(
                        onTap: () {},
                        placeholder: const Text(
                          "Let's Go",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
