import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../widgets/e_menu.dart';
import 'e_homepage.dart';

class EcormSplashScreen extends StatefulWidget {
  static const routeName = '/EcormSplashScreen';

  const EcormSplashScreen({Key? key}) : super(key: key);

  @override
  State<EcormSplashScreen> createState() => _EcormSplashScreenState();
}

class _EcormSplashScreenState extends State<EcormSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return const EMenu();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: deviceHeight(context) * 0.35,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/splash1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSplashImage('assets/images/splash2.png'),
                  _buildTextColumn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSplashImage(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextColumn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buy From Us',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColor.whiteColor,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Favourite',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: AppColor.whiteColor,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'CREATOR',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
        _buildGoButton(),
      ],
    );
  }

  Widget _buildGoButton() {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/brec.png'),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 179, 103, 4),
            blurRadius: 1,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (__) {
                return const EHomeScreen();
              }),
              (route) => false,
            );
          },
          child: const Column(
            children: [
              Spacer(),
              Row(
                children: [
                  Text(
                    'Go',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
