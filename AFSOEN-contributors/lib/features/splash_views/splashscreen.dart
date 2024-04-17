import 'package:afsoen/features/splash_views/onboarding.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      context.go(Onboarding.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ExtendedImage.asset(
          'assets/images/logo.png',
          width: deviceWidth(context) * 0.5,
        ),
      ),
    );
  }
}
