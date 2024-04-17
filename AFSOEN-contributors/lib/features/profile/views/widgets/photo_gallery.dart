import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';

class BuildPhotoGallery extends StatelessWidget {
  const BuildPhotoGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        padding: const EdgeInsets.all(8.0), // padding around the grid
        itemCount: 21,
        itemBuilder: (context, index) {
          return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/photop.png'),
                fit: BoxFit.cover,
              )),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: deviceHeight(context) * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: AppColor.orangeColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: Column(children: [
                      Text(
                        '1.1m',
                        style: AppTextStyle(ww: FontWeight.w500, size: 10, color: Colors.black),
                      ),
                      Text('views', style: AppTextStyle(ww: FontWeight.w500, size: 10, color: Colors.black)),
                    ]),
                  ),
                ),
              ));
        });
  }
}
