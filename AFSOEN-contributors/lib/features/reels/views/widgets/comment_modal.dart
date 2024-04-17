import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:afsoen/features/reels/views/widgets/comment_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flash/flash.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CommentModalScreen extends StatelessWidget {
  CommentModalScreen({super.key, required this.comment});
  final String comment;

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 11.h,),
        Text('$comment comments'),
        SizedBox(height: 16.h,),
        SizedBox(
          height: deviceHeight(context)*0.45,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
              return const CommentTile(name: 'John', comment: 'Doing this would make me so anxious', time: '2hr', replies: 7);
                },),
        ),
        Container(
          height: deviceHeight(context)*0.052, width: 316.w,
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 22.w),
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(20.r))
          ),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Add comment',
                      hintStyle: AppTextStyle(ww: FontWeight.w500, size: 15.sp, color: Colors.black),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: Colors.transparent, width: 0.w)
                      ),
                      border: InputBorder.none
                  ),
                  controller: _commentController,
                  // onChanged: onChanged,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/Ad Sign Stroke Icon.png', width: 22.w, height: 22.h,),
                  SizedBox(width: 15.w,),
                  Image.asset('assets/images/Emoji Stroke Icon.png', width: 22.w, height: 22.h,),
                  SizedBox(width: 15.w,),
                  Image.asset('assets/images/Polygon 4.png', width: 22.w, height: 22.h,),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
