// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';

class OTPOutlinedTextField extends StatelessWidget {
  const OTPOutlinedTextField({
    Key? key,
    required this.focusNode,
    this.onChanged,
    this.outputText,
    this.isErrorExists,
  }) : super(key: key);

  final focusNode;
  final onChanged;
  final outputText;
  final isErrorExists;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
      child: TextField(
        keyboardType: TextInputType.number,
        style: const TextStyle(color: kBlackColor, fontSize: 18),
        maxLength: 1,
        onChanged: onChanged,
        focusNode: focusNode,
        cursorColor: kGreenColor,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isErrorExists
                      ? kErrorColor
                      : kOutlinedTextFiledBorderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: isErrorExists ? kErrorColor : kGreyColor),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
