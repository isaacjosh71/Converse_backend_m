import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class StatusSection extends StatelessWidget {
  static final List<String> imagePaths = [
    'assets/images/male.png',
    'assets/images/musician.png',
    'assets/images/reels.png',
    'assets/images/female.png',
    'assets/images/male.png',
    'assets/images/musician.png',
    'assets/images/reels.png',
    'assets/images/musician.png',
    'assets/images/female.png',
  ];

  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
        child: Expanded(
          child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.7),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                  child: CircleAvatar(
                    foregroundColor: Colors.white,
                    radius: 30.0,
                    backgroundImage: AssetImage(imagePaths[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
