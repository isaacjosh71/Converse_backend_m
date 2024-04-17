import 'package:afsoen/features/ecommerce/views/screens/e_homepage.dart';

import 'package:afsoen/core/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class EMenu extends StatefulWidget {
  const EMenu({super.key});

  static const routeName = '/EMenu';

  @override
  State<EMenu> createState() => _EMenuState();
}

class _EMenuState extends State<EMenu> {
  PageController pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const EHomeScreen(),
        Container(),
        Container(),
        Container(),
        Container(),
      ][currentIndex],
      bottomNavigationBar: SizedBox(
        child: BottomAppBar(
            elevation: 0,
            child: Row(
              children: [
                SizedBox(
                  width: deviceWidth(context) * 0.02,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: const Icon(Icons.home),
                ),
                SizedBox(
                  width: deviceWidth(context) * 0.08,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: ExtendedImage(image: const AssetImage('assets/images/ecom.png'))),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  width: deviceWidth(context) * 0.08,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: const Icon(Icons.notifications),
                ),
                // SizedBox(width: deviceWidth(context) * 0.07),
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const CircleAvatar(
            // decoration: const BoxDecoration(shape: BoxShape.circle),
            backgroundImage: ExtendedAssetImageProvider('assets/images/logo.png')),
      ),
    );
  }
}
