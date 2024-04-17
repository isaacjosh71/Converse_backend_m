import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../widgets/photo_gallery.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSending = false;
  bool isFollowing = false;
  int _selectedIndex = 0;
  List albumlsList = ['Videos', 'Photos', 'Shop'];
  List albumScreen = [const BuildPhotoGallery(), Container(), Container()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                buildProfileHeader(context),
                SizedBox(
                  height: deviceHeight(context) * 0.03,
                ),
                buildProfileStats(),
                SizedBox(
                  height: deviceHeight(context) * 0.02,
                ),
                buildAlbumSelector(context),
                SizedBox(
                  height: deviceHeight(context) * 0.03,
                ),
                albumScreen[_selectedIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildAlbumSelector(BuildContext context) {
    return Container(
      height: deviceHeight(context) * 0.09,
      width: deviceWidth(context),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(23), color: AppColor.greyColor),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            albumlsList.length,
            (index) => InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: deviceWidth(context) * 0.01),
                width: deviceWidth(context) * 0.2,
                height: deviceHeight(context) * 0.05,
                decoration: BoxDecoration(
                  color: _selectedIndex == index ? AppColor.orangeColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    albumlsList[index],
                    style: AppTextStyle(ww: FontWeight.w500, size: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Row buildProfileStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [profileReactionCtn(title: '330K', subtitle: 'Followers'), profileReactionCtn(title: '20', subtitle: 'Post'), profileReactionCtn(title: '2', subtitle: 'Product')],
    );
  }

  Row buildProfileHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          height: deviceHeight(context) * 0.25,
          width: deviceWidth(context) * 0.25,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/musician.png',
                  ),
                  fit: BoxFit.contain),
              border: Border.all(
                color: AppColor.orangeColor,
                width: 5,
              ),
              shape: BoxShape.circle),
        ),
        SizedBox(
          width: deviceWidth(context) * 0.05,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Yusuf Aishat',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.001,
                  ),
                  const Text(
                    'Video Editor',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: deviceHeight(context) * 0.001,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSending = true;
                      });
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isSending = false;
                          isFollowing = !isFollowing; // Toggle the state
                        });
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                      child: isSending
                          ? const SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : Text(
                              isFollowing ? 'Followed' : 'Follow',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    width: deviceWidth(context) * 0.04,
                  ),
                  Image.asset('assets/images/coin.png'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      toolbarHeight: 50,
      elevation: 0.0,
      scrolledUnderElevation: 0,
      leading: OutlinedButton(onPressed: () {}, child: const Icon(Icons.arrow_back_ios)),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: AppColor.orangeColor,
            ))
      ],
    );
  }

  profileReactionCtn({required String title, required String subtitle}) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle(color: Colors.white, size: 20, ww: FontWeight.w700),
        ),
        Text(
          subtitle,
          style: AppTextStyle(color: const Color.fromARGB(255, 160, 152, 152), size: 14, ww: FontWeight.w700),
        ),
      ],
    );
  }
}
