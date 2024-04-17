// import 'package:afsoen/old_arch/providers/auth_provider.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderItem extends ConsumerStatefulWidget {
  const GenderItem({super.key});

  @override
  ConsumerState<GenderItem> createState() => _GenderItemState();
}

class _GenderItemState extends ConsumerState<GenderItem> {
  int? _isSelected;
  late String gender;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Image.asset(
                "assets/images/male.png",
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Transform.scale(
                    scale: deviceWidth(context) * 0.005,
                    child: Radio(
                      groupValue: _isSelected,
                      value: 1,
                      onChanged: (newValue) {
                        setState(() {
                          _isSelected = newValue;
                          gender = 'MALE';
                          // ref.read(authProivder).getUserGender(gender: gender);
                        });
                      },
                      activeColor: AppColor.orangeColor,
                      fillColor: MaterialStateColor.resolveWith(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return AppColor.orangeColor;
                          }
                          return AppColor.lightOrange;
                        },
                      ),
                    ),
                  ),
                  const Text(
                    "MALE",
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Image.asset(
                "assets/images/female.png",
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Transform.scale(
                    scale: deviceWidth(context) * 0.005,
                    child: Radio(
                      groupValue: _isSelected,
                      value: 2,
                      onChanged: (newValue) {
                        setState(() {
                          _isSelected = newValue;
                          gender = 'FEMALE';
                          // ref.read(authProivder).getUserGender(gender: gender);
                        });
                      },
                      activeColor: AppColor.orangeColor,
                      fillColor: MaterialStateColor.resolveWith(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return AppColor.orangeColor;
                          }
                          return AppColor.lightOrange;
                        },
                      ),
                    ),
                  ),
                  const Text(
                    "FEMALE",
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
