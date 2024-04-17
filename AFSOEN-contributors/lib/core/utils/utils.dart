import 'package:flutter/material.dart';

double deviceHeight(context) => MediaQuery.of(context).size.height;
double deviceWidth(context) => MediaQuery.of(context).size.width;

showMessageSnack(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
