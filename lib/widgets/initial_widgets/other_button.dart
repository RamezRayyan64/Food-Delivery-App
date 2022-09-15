// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/widgets/initial_widgets/rounded_rectangle_button.dart';

class OtherButton extends StatelessWidget {
  const OtherButton({Key? key, this.onPressedFaceBook, this.onPressedGoogle})
      : super(key: key);
  final onPressedFaceBook;
  final onPressedGoogle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedRectangleButton(
          text: kCONTINUEWITHFACEBOOK,
          onPressed: onPressedFaceBook,
          backgroundColor: kFacebookColor,
        ),
        const SizedBox(
          height: 10,
        ),
        RoundedRectangleButton(
          text: kCONTINUEWITHGOOGLE,
          onPressed: onPressedGoogle,
          backgroundColor: kGoogleColor,
        ),
      ],
    );
  }
}
