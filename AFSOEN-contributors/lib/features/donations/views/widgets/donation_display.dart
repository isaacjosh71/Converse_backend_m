import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:afsoen/features/auth/views/widgets/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flash/flash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DonationModalScreen extends StatefulWidget {
  const DonationModalScreen({super.key});

  @override
  State<DonationModalScreen> createState() => _DonationModalScreenState();
}

class _DonationModalScreenState extends State<DonationModalScreen> {
  final List _feeDisplay = [
    {"amount": '500'},
    {"amount": '1000'},
    {"amount": '2000'},
  ];

  final TextEditingController _amountFieldController = TextEditingController();


  void _updateTextField(String value) {
    _amountFieldController.text = value;
  }

  int _selectedIndex = 0;

  void _showTopFlash({FlashBehavior style = FlashBehavior.fixed}) {
    context.pop();
    showFlash(
      context: context,
      duration: const Duration(seconds: 1),
      persistent: true,
      builder: (_, controller) {
        return Flash(
            controller: controller,
            position: FlashPosition.top,
            child: FlashBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor, controller: controller, content: FlashBarDisplay(context: context)));
      },
    );
  }

  @override
  void initState() {
    _amountFieldController.text = _feeDisplay[0]['amount'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 13.h,
      ),
      Text(
        "Choose Amount",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.whiteColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: deviceHeight(context) * 0.009,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 55.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              _feeDisplay.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                    String clickedText = _feeDisplay[index]['amount'];
                    _updateTextField(clickedText);
                  });
                },
                child: SizedBox(
                  width: 73.w, height: 63.h,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(width: 3.w, color: _selectedIndex == index ? AppColor.orangeColor : AppColor.greyColor),
                      ),
                      child: Text(
                        'N${_feeDisplay[index]['amount']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13.sp,color: _selectedIndex == index ? AppColor.orangeColor : AppColor.greyColor, fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            )),
      ),
      SizedBox(
        height: deviceHeight(context) * 0.02,
      ),
      SizedBox(
        width: 189.w, height: 38.h,
        child: TextFormField(
          textAlign: TextAlign.center,
          controller: _amountFieldController,
          style: const TextStyle(
            color: AppColor.whiteColor,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.greyColor, hintText: "Enter amount manually",
            hintStyle: const TextStyle(color: AppColor.whiteColor),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.none),
          ),
        ),
      ),
      SizedBox(
        height: deviceHeight(context) * 0.023,
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(right: 19.w),
          child: SizedBox(
            width: 127.w, height: 37.h,
            child: AppButton(
                onTap: _showTopFlash,
                placeholder: Text(
                  "Donate Now",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                )),
          ),
        ),
      ),
    ]);
  }
}

class FlashBarDisplay extends StatelessWidget {
  const FlashBarDisplay({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth(context) * 0.9,
      height: deviceHeight(context) * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 120.r,
            backgroundColor: AppColor.orangeColor,
            child: Center(
              child: Icon(
                Icons.check_sharp,
                size: 30.sp,
                color: AppColor.whiteColor,
              ),
            ),
          ),
          Text(
            "Thanks for Donating",
            style: TextStyle(color: AppColor.whiteColor, fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              "The world is a better place with you in it",
              maxLines: 2,
              style: TextStyle(color: AppColor.whiteColor, fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
