// ignore_for_file: must_be_immutable

import 'package:afsoen/features/dashboard/views/widgets/story_eclipse.dart';
import 'package:afsoen/features/notifications/component/story_datalist.dart';
import 'package:afsoen/core/utils/utils.dart';

import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context) * .14,
      width: deviceWidth(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              height: deviceHeight(context) * .02,
            ),
            SizedBox(
              width: deviceWidth(context) * .02,
            ),
            postStoryEclipse(context, dataList[0]['profile image']),
            Row(
              children: List.generate(
                dataList.length,
                (index) => StoryEclipse(
                  firstName: dataList[index]['first name'],
                  imgUrl: dataList[index]['profile image'],
                ),
              ),
            ),
            SizedBox(
              width: deviceWidth(context) * .02,
            ),
          ],
        ),
      ),
    );
  }
}
