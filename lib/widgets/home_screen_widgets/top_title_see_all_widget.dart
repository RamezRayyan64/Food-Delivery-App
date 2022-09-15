// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/strings.dart';

class TopTitleWidget extends StatelessWidget {
  const TopTitleWidget({
    Key? key,
    required this.titleText,
    required this.onPressedSeeAll,
    this.text,
    this.textColor,
  }) : super(key: key);
  final titleText;
  final onPressedSeeAll;
  final text;
  final textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              titleText,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
              onPressed: onPressedSeeAll,
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 18),
              ))
        ],
      ),
    );
  }
}
