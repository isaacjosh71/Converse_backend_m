// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AppColor {
  static const Color orangeColor = Color(0xffFFA800);
  static const Color lightOrange = Color.fromARGB(255, 247, 204, 118);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color greyColor = Color(0xff252525);
  
}
TextStyle AppTextStyle({required FontWeight ww, required double size, required Color color}) {
  return TextStyle(fontSize: size, fontWeight: ww, color: color);
}