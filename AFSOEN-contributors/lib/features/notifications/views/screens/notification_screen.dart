import 'package:afsoen/features/notifications/component/story_datalist.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../widgets/story_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Notification',
          style: AppTextStyle(ww: FontWeight.bold, size: 18, color: Colors.white),
        ),
        scrolledUnderElevation: 0,
        leading: OutlinedButton(
            onPressed: () {},
            child: const Icon(
              Icons.arrow_back_ios,
            )),
        actions: [
          Image.asset('assets/images/radio.png'),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Expanded(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const StoryWidget(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 51, 48, 48), width: 0.4), borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        leading: Padding(
                          padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * .01),
                          child: Container(
                            width: deviceWidth(context) * .16,
                            height: deviceWidth(context) * .16,
                            padding: EdgeInsets.all(deviceWidth(context) * .009),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color.fromARGB(255, 228, 227, 225), Color.fromARGB(255, 241, 239, 234)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundImage: ExtendedNetworkImageProvider(
                                dataList[index]['profile image'],
                                cache: true,
                              ),
                            ),
                          ),
                        ),
                        trailing: Image.asset('assets/images/radio.png'),
                        title: Row(
                          children: [
                            Text(
                              dataList[index]['first name'],
                              style: AppTextStyle(ww: FontWeight.bold, size: 16, color: Colors.white),
                            ),
                            SizedBox(
                              width: deviceWidth(context) * 0.02,
                            ),
                            const CircleAvatar(
                              radius: 2,
                              backgroundColor: AppColor.orangeColor,
                            ),
                            SizedBox(
                              width: deviceWidth(context) * 0.02,
                            ),
                            Text(
                              '4m ago',
                              style: AppTextStyle(ww: FontWeight.bold, size: 14, color: Colors.white70),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Just posted a video',
                          style: AppTextStyle(ww: FontWeight.w500, size: 16, color: Colors.white70),
                        ),
                      ),
                    );
                  })
            ],
          ),
        )),
      ),
    );
  }
}
