import 'package:afsoen/features/dashboard/views/screens/home_screen.dart';
import 'package:afsoen/features/profile/views/screens/profile.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../features/ecommerce/views/screens/ecorm_splash.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  static const routeName = '/menu';

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  PageController pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomeScreen(),
        const EcormSplashScreen(),
        const ProfilePage(),
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
                  child: const Column(
                    children: [
                      Icon(Icons.home),
                      Text('Home'),
                    ],
                  ),
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
                  child: const Column(
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      Text('Cart')
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.person),
                      Text('Profile'),
                    ],
                  ),
                ),
                SizedBox(width: deviceWidth(context) * 0.07),
              ],
            )),
      ),
      //  NavigationBar(
      //   destinations: [
      //     const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
      //     const NavigationDestination(
      //         icon: Icon(Icons.shopping_cart_outlined), label: 'Store'),
      //     SizedBox(
      //       width: deviceWidth(context) * 0.6,
      //     ),
      //     const NavigationDestination(
      //         icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      //   selectedIndex: currentIndex,
      //   onDestinationSelected: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const CircleAvatar(
            // decoration: const BoxDecoration(shape: BoxShape.circle),
            backgroundImage:
                ExtendedAssetImageProvider('assets/images/logo.png')),
      ),
    );
  }
}
