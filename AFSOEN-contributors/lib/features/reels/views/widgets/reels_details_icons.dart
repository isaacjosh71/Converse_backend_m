import 'package:afsoen/features/donations/views/widgets/donation_display.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:afsoen/features/reels/views/widgets/comment_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReelsDetailsAndIcons extends StatelessWidget {
  final String username;
  final String caption;
  final String hashtags;

  const ReelsDetailsAndIcons(this.username, this.caption, this.hashtags, {super.key});

  void _showDonationModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return Container(
            height: 243.h,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
            ),
            child: const DonationModalScreen(),
          );
        });
  }

  final String comment = '576';

  void _showCommentsModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return Container(
            height: deviceHeight(context)*0.622,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(29.r), topRight: Radius.circular(29.r)),
            ),
            child: CommentModalScreen(comment: comment,),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(deviceWidth(context) * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: caption,
                          style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.normal,
                            color: AppColor.whiteColor,
                          ),
                        ),
                        TextSpan(
                          text: ' #$hashtags',
                          style: TextStyle(fontSize: 15.sp, color: AppColor.whiteColor, fontWeight: FontWeight.normal),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      children: [
                        Text(
                          '@$username',
                          style: TextStyle(fontSize: 15.sp, color: AppColor.whiteColor, fontWeight: FontWeight.w600),
                        ),
                        ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: AppColor.whiteColor,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Follow",
                            style: TextStyle(fontSize: 15.sp, color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.music_note,
                    //       size: 20,
                    //       color: AppColor.whiteColor,
                    //     ),
                    //     Text(
                    //       '@$musicArtist - $musicTitle',
                    //       style: const TextStyle(
                    //         color: AppColor.whiteColor,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/afsoen.png', height: 34.h, width: 36.w,),
                    SizedBox(
                      height: 30.h
                    ),
                    Transform.scale(
                      scale: 1.0,
                      child: GestureDetector(
                        onTap: () => _showCommentsModal(context),
                        child: Column(
                          children: [
                            Image.asset('assets/images/Subtract.png',height: 40.h, width: 37.w,),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              comment,
                              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: AppColor.orangeColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Transform.scale(
                        scale: 1.4,
                        child: GestureDetector(
                          onTap: () => _showDonationModal(context),
                          child: Image.asset(
                            "assets/images/coin.png",
                            height: 43.h, width: 43.w,
                          ),
                        )),
                    SizedBox(height: 34.h),
                    _badge(),
                    SizedBox(height: 14.h),
                  ],
                ),
              ],
            ),
          ],
        ));
  }


  Widget _badge(){
    return Stack(
      children: [
        Image.asset(
          "assets/images/reels-img.png",
          width: 48.h, height: 58.h,
        ),
        Positioned(
          top: 35, left: 15.w,
          child: CircleAvatar(
            backgroundColor: AppColor.orangeColor,
            radius: 10.r,
            child: Center(
              child: Icon(
                Icons.add,
                size: 12.sp,
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
