import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget placeholder;
  const AppButton({super.key, required this.onTap, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 700,
        height: deviceHeight(context) * 0.08,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [
              AppColor.orangeColor,
              AppColor.lightOrange.withOpacity(0.9),
              AppColor.orangeColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: placeholder,
      ),
    );
  }
}
