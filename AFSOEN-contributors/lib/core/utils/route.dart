// import 'package:afsoen/old_arch/screens/dashboard/home_screen.dart';
import 'package:afsoen/features/dashboard/views/screens/bottom_nav_bar.dart';
import 'package:afsoen/features/reels/views/screens/reels.dart';
import 'package:afsoen/features/auth/views/screens/all_done.dart';
import 'package:afsoen/features/auth/views/screens/date_of_birth.dart';
import 'package:afsoen/features/auth/views/screens/gender.dart';
import 'package:afsoen/features/auth/views/screens/log_in.dart';
import 'package:afsoen/features/auth/views/screens/sign_up.dart';
import 'package:afsoen/features/auth/views/screens/upload_profile_picture.dart';
import 'package:afsoen/features/auth/views/screens/what_is_your_name.dart';
import 'package:afsoen/features/auth/views/screens/who_are_you.dart';
import 'package:afsoen/features/auth/views/screens/your_interests.dart';
import 'package:afsoen/features/splash_views/onboarding.dart';

import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const SplashScreen(),
    // ),
    GoRoute(
      path: '/',
      builder: (context, state) => const Menu(),
    ),
    GoRoute(
      path: Onboarding.routeName,
      builder: (context, state) => const Onboarding(),
    ),
    GoRoute(
      path: SignUP.routeName,
      builder: (context, state) => const SignUP(),
    ),
    GoRoute(
      path: Login.routeName,
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: WhoAreYou.routeName,
      builder: (context, state) => const WhoAreYou(),
    ),
    GoRoute(
      path: YourInterests.routeName,
      builder: (context, state) => YourInterests(),
    ),
    GoRoute(
      path: WhatIsYourName.routeName,
      builder: (context, state) => const WhatIsYourName(),
    ),
    GoRoute(
      path: DateOfBirth.routeName,
      builder: (context, state) => const DateOfBirth(),
    ),
    GoRoute(
      path: ChooseGender.routeName,
      builder: (context, state) => const ChooseGender(),
    ),
    GoRoute(
      path: UploadProfilePicture.routeName,
      builder: (context, state) => const UploadProfilePicture(),
    ),
    GoRoute(
      path: FinalRegistrationScreen.routeName,
      builder: (context, state) => const FinalRegistrationScreen(),
    ),
    GoRoute(
      path: ReelsScreen.routeName,
      builder: (context, state) => const ReelsScreen(),
    ),
    GoRoute(
      path: Menu.routeName,
      builder: (context, state) => const Menu(),
    ),
  ],
);
