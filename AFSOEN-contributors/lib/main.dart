import 'package:afsoen/features/reels/views/screens/reels.dart';
import 'package:afsoen/firebase_options.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.useAuthEmulator('http://127.0.0.1', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator('http://127.0.0.1', 8080);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
        minTextAdapt: true, splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp
          .router
          (
            title: 'AFSOEN',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          fontFamily: "Poppins",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            color: Colors.black,
          ),
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.orangeColor,
          ),
          primaryColor: AppColor.orangeColor,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: AppColor.whiteColor),
            bodySmall: TextStyle(color: AppColor.whiteColor),
            bodyLarge: TextStyle(color: AppColor.whiteColor),
            displayMedium: TextStyle(color: AppColor.whiteColor),
          ),
          hintColor: AppColor.greyColor,
          navigationBarTheme: const NavigationBarThemeData(
            backgroundColor: Colors.black,
          ),
        ),
        routerConfig: router,
      );}
    );
  }
}
