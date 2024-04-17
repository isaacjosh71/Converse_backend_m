// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:afsoen/features/auth/views/screens/what_is_your_name.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:afsoen/features/auth/views/widgets/reg_icon_text.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WhoAreYou extends ConsumerStatefulWidget {
  const WhoAreYou({super.key});

  static const routeName = '/who-are-you';

  @override
  ConsumerState<WhoAreYou> createState() => _WhoAreYouState();
}

class _WhoAreYouState extends ConsumerState<WhoAreYou> {
  Color colorTrans = Colors.transparent;

  List carouselImages = [
    {
      "image": "assets/images/musician.png",
      "text": "MUSICIAN",
    },
    {
      "image": "assets/images/dancer.png",
      "text": "DANCER",
    },
    {
      "image": "assets/images/blogger.png",
      "text": "BLOGGER",
    },
    {
      "image": "assets/images/actor.png",
      "text": "ACTOR",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          RegistrationTitle(
            regTitle: "Which African Giant Are You",
            navigateTo: () => context.push(WhoAreYou.routeName),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: deviceHeight(context) * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => Container(
                margin: EdgeInsets.only(left: 15),
                color: colorTrans,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      carouselImages[index]["image"],
                      width: deviceWidth(context) * 0.4,
                    ),
                    Text(
                      carouselImages[index]["text"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              itemCount: carouselImages.length,
            ),
          ),
          Container(
            width: deviceWidth(context) * 0.9,
            height: deviceHeight(context) * 0.17,
            padding: EdgeInsets.only(top: 5, bottom: 10, left: 3),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "## Promise to self",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: deviceWidth(context) * 0.8,
                  child: Center(
                    child: Text(
                      "Write a short note on what you want to achieve with Afsoen/old_arch ..the number of followers you want to have,how much you want to make and the kind of experience you expect.",
                      style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          AppButton(
            onTap: () {
              // context.go(YourInterests.routeName);
              context.push(WhatIsYourName.routeName);
              // context.pop();
            },
            placeholder: Text("EXPLORE NOW"),
          ),
        ],
      )),
    );
  }
}
