// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';

class ViewPager extends StatelessWidget {
  const ViewPager({
    Key? key,
    this.imageSource,
    this.titleText,
    this.descriptionText,
  }) : super(key: key);
  final imageSource;
  final titleText;
  final descriptionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/onboarding_assets/$imageSource.png',
          height: 300,
          width: double.infinity,
        ),
        Text(
          titleText,
          style: const TextStyle(fontSize: 36),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            descriptionText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, color: kGreyColor),
          ),
        )
      ],
    );
  }
}
