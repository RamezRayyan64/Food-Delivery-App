// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';

class RoundedRectangleButton extends StatelessWidget {
  const RoundedRectangleButton({
    Key? key,
    this.text,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);
  final text;
  final onPressed;
  final backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: kWhiteColor, fontSize: 18),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))))),
    );
  }
}
