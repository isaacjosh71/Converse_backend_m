import 'package:afsoen/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({super.key, required this.name, required this.comment, required this.time, required this.replies});
  final String name;
  final String comment;
  final String time;
  final int replies;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 8.h, bottom: 10.h, left: 15.w, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CircleAvatar(
               radius: 20.r,
               backgroundImage: const AssetImage('assets/images/comment_avatar.png'),
             ),
              SizedBox(width: 12.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTextStyle(ww: FontWeight.w500, size: 13.sp, color: AppColor.orangeColor),),
                  SizedBox(height: 5.h,),
                  SizedBox(
                    width: 245.w,
                    child: Text(comment,
                      maxLines: 5,
                      style: AppTextStyle(ww: FontWeight.w500, size: 15.sp, color: AppColor.whiteColor),),
                  ),
                  SizedBox(height: 12.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'View replies',
                              style: AppTextStyle(ww: FontWeight.w500, size: 13.sp, color: AppColor.orangeColor),),
                            TextSpan(text: ' ($replies)',
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () {},
                              style: AppTextStyle(ww: FontWeight.w500, size: 13.sp, color: AppColor.orangeColor),),
                          ],
                        ),),
                      Icon(Icons.arrow_drop_down_rounded, color: AppColor.orangeColor, size: 20.sp,)
                    ],
                  ),
                ],
              )
            ],
          ),
          Text(time, style: AppTextStyle(ww: FontWeight.w500, size: 13.sp, color: AppColor.orangeColor),)
        ],
      ),
    );
  }
}
