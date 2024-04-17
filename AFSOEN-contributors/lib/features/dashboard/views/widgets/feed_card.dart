import 'package:afsoen/features/donations/views/widgets/donation_display.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';


class FeedCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const FeedCard({super.key, required this.data});

  void _showDonationModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return Container(
            height: deviceHeight(context) * 0.4,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: const DonationModalScreen(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth(context),
      height: deviceHeight(context) * 0.5,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.01)
                    .copyWith(
              top: constraints.maxHeight * 0.03,
              right: 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.15,
                          height: constraints.maxWidth * 0.14,
                          padding: EdgeInsets.all(constraints.maxWidth * 0.01),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExtendedNetworkImageProvider(
                                data['profile image'],
                                // Add additional entries here
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.02,
                        ),
                        Text.rich(
                          TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: deviceHeight(context) * 0.022,
                                ),
                            children: [
                              TextSpan(
                                text: '${data['first name']} \n',
                              ),
                              TextSpan(
                                text: '${data['location']}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: deviceHeight(context) * 0.015,
                                    ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      child: Container(
                        width: constraints.maxWidth * 0.1,
                        height: constraints.maxWidth * 0.1,
                        padding: EdgeInsets.all(constraints.maxWidth * 0.01),
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.more_vert,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(right: constraints.maxWidth * 0.3),
                  child: Text(
                    data['short blog'],
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: deviceHeight(context) * 0.019,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
                //Content Image
                Row(
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.83,
                      height: constraints.maxHeight * 0.6,
                      padding: EdgeInsets.all(constraints.maxWidth * 0.01),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: ExtendedNetworkImageProvider(
                            data['profile image'],
                            cache: true,
                            // Add additional entries here
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: ExtendedImage.asset(
                            'assets/images/emoji.png',
                            // width: constraints.maxWidth * 0.15,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: ExtendedImage.asset('assets/images/Buy.png'),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: ExtendedImage.asset('assets/images/share.png'),
                        ),
                        IconButton(
                          onPressed: () => _showDonationModal(context),
                          icon: ExtendedImage.asset('assets/images/coin.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Text('2k'),
                      SizedBox(
                        width: constraints.maxWidth * 0.02,
                      ),
                      ExtendedImage.asset('assets/images/emoji.png'),
                      SizedBox(
                        width: constraints.maxWidth * 0.02,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.7,
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color:
                                        AppColor.whiteColor.withOpacity(0.4)),
                            hintText: 'Comments.....',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: constraints.maxHeight * 0.1,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColor.whiteColor,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
