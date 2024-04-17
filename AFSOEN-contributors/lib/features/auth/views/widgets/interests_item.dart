// ignore_for_file: prefer_const_constructors

import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';

class InterestsItem extends StatefulWidget {
  const InterestsItem(this.image, this.text, {super.key});

  final String image;
  final String text;

  @override
  State<InterestsItem> createState() => _InterestsItemState();
}

class _InterestsItemState extends State<InterestsItem> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        color: _isTapped ? AppColor.orangeColor : Colors.white.withOpacity(0.1599999964237213),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: Image.asset(
              widget.image,
              width: deviceWidth(context) * 1,
            )),
            Flexible(
                child: Text(
              widget.text,
              style: TextStyle(color: AppColor.whiteColor, fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
    );
  }
}
