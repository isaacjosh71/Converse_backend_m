import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isEmail;
  final bool isPassword;
  final TextEditingController textController;
  const AppInput({
    super.key,
    required this.title,
    required this.hintText,
    required this.textController,
    this.isEmail = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(deviceHeight(context) * 0.008).copyWith(left: 4),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: deviceHeight(context) * 0.016,
                ),
          ),
        ),
        TextFormField(
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "This field is required";
            }
            return null;
          },
          controller: textController,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.whiteColor,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        )
      ],
    );
  }
}

class DateInput extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback pickDate;

  const DateInput({
    super.key,
    required this.title,
    required this.pickDate,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(deviceHeight(context) * 0.008).copyWith(left: 4),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: deviceHeight(context) * 0.016,
                ),
          ),
        ),
        InkWell(
          onTap: pickDate,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: deviceHeight(context) * 0.02,
              horizontal: deviceWidth(context) * 0.04,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1.5,
                color: AppColor.orangeColor,
              ),
            ),
            child: Text(date),
          ),
        ),
      ],
    );
  }
}
