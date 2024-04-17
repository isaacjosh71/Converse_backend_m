import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class StoryEclipse extends StatelessWidget {
  final String firstName;
  final String imgUrl;
  const StoryEclipse({
    super.key,
    required this.firstName,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * .01),
          child: Container(
            width: deviceWidth(context) * .16,
            height: deviceWidth(context) * .16,
            padding: EdgeInsets.all(deviceWidth(context) * .01),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColor.orangeColor, AppColor.lightOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: CircleAvatar(
              backgroundImage: ExtendedNetworkImageProvider(
                imgUrl,
                cache: true,
              ),
            ),
          ),
        ),
        SizedBox(
          height: deviceHeight(context) * 0.01,
        ),
        Text(
          firstName,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                // fontWeight: FontWeight.bold,
                fontSize: deviceHeight(context) * 0.018,
              ),
        ),
      ],
    );
  }
}

Widget postStoryEclipse(BuildContext context, String profileImage) {
  return InkWell(
    onTap: () {},
    child: Column(
      children: [
        Container(
          width: deviceWidth(context) * .16,
          height: deviceWidth(context) * .16,
          padding: EdgeInsets.all(deviceWidth(context) * .01),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppColor.orangeColor, AppColor.lightOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: CircleAvatar(
            radius: deviceHeight(context) * 0.1,
            backgroundImage: ExtendedNetworkImageProvider(
              ///[Profile image] filled with domi data
              profileImage,
              cache: true,
            ),
            child: Container(
              width: deviceHeight(context) * .035,
              height: deviceHeight(context) * .035,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).cardColor,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: deviceHeight(context) * 0.01,
        ),
        Text(
          'Add Story',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                // fontWeight: FontWeight.bold,
                fontSize: deviceHeight(context) * 0.018,
              ),
        ),
      ],
    ),
  );
}
