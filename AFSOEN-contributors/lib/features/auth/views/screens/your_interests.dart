// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:afsoen/features/auth/views/widgets/interests_item.dart';
import 'package:afsoen/features/auth/views/widgets/reg_icon_text.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class Interests {
//   // final String id;
//   final String image;
//   final String title;

//   const Interests({
//     // required this.id,
//     required this.title,
//     required this.image,
//   });
// }


class YourInterests extends StatelessWidget {
  YourInterests({super.key});

  static const routeName = '/your-interests';

  List personalInterests = [
    {
      "images": "assets/images/e_music.png",
      "text": "Music",
    },
    {
      "images": "assets/images/e_fashion.png",
      "text": "Fashion",
    },
    {
      "images": "assets/images/e_business.png",
      "text": "Business",
    },
    {
      "images": "assets/images/e_scifi.png",
      "text": "Sci fi",
    },
    {
      "images": "assets/images/e_comics.png",
      "text": "Comics",
    },
    {
      "images": "assets/images/e_memes.png",
      "text": "Memes",
    },
    {
      "images": "assets/images/e_news.png",
      "text": "Local News",
    },
    {
      "images": "assets/images/e_movies.png",
      "text": "Movies",
    },
    {
      "images": "assets/images/e_gaming.png",
      "text": "Gaming",
    },
    {
      "images": "assets/images/e_clothing.png",
      "text": "Clothings",
    },
  ];

  final String coloredText = "creative interest...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RegistrationTitle(
              regTitle: "What is your interest?",
              navigateTo: () => context.pop(),
            ),
            SizedBox(
              width: deviceWidth(context) * 1,
              height: deviceHeight(context) * 0.55,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (ctx, index) {
                  return InterestsItem(personalInterests[index]["images"], personalInterests[index]["text"]);
                },
                itemCount: personalInterests.length,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: "No matter your "),
                      TextSpan(text: "creative interest ... ", style: TextStyle(color: AppColor.orangeColor)),
                      TextSpan(text: "you are still "),
                      TextSpan(text: "royalty", style: TextStyle(color: AppColor.orangeColor))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
