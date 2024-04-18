import 'package:afsoen/features/reels/views/widgets/reels_content.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  static const routeName = "/reels";

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final List _reelsInterests = [
    "For you",
    "Music",
    "Travel",
    "Fashion",
    "Sports",
    "Movies",
  ];


  int _selectedIndex = 0;

  final List<Uri> _videos = [
    Uri.parse(
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            itemCount: _videos.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return ReelsContent(_videos[index]);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 71.h),
            width: deviceWidth(context) * 1,
            height: 35.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 12.w),
                  width: 92.5.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: _selectedIndex == index ? AppColor.orangeColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(
                        width: 2,
                        color: AppColor.orangeColor,
                      )),
                  child: Center(
                    child: Text(
                      _reelsInterests[index],
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold,color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ),
              itemCount: _reelsInterests.length,
            ),
          )
        ],
      ),
    );
  }
}
