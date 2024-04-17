import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';

class RegistrationTitle extends StatelessWidget {
  final String regTitle;
  final VoidCallback navigateTo;
  const RegistrationTitle({super.key, required this.regTitle, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60.0, left: 10),
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1.0,
              ),
            ),
            child: IconButton(
              onPressed: navigateTo,
              icon: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.orange,
                size: 20.0,
              ),
            ),
          ),
          SizedBox(
            // height: deviceHeight(context) * 0.8,
            // width: deviceWidth(context),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: deviceWidth(context) * 0.35,
                  ),
                ),
                Text(
                  regTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
