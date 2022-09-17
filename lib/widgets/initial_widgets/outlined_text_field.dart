// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/constants/lists.dart';

class OutlinedTextField extends StatelessWidget {
  const OutlinedTextField({
    Key? key,
    this.onChange,
    this.hintText,
    this.isTextObsecure,
    this.keyboardType,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.suffixIconColor,
    this.validatorErrorText,
    this.isErrorExist,
  }) : super(key: key);
  final onChange;
  final hintText;
  final isTextObsecure;
  final keyboardType;
  final suffixIcon;
  final suffixIconOnTap;
  final suffixIconColor;
  final validatorErrorText;
  final isErrorExist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          width: double.infinity,
          child: TextField(
            keyboardType: keyboardType,
            style: const TextStyle(color: kBlackColor, fontSize: 18),
            onChanged: onChange,
            cursorColor: kGreenColor,
            obscureText: isTextObsecure,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: suffixIconOnTap,
                  child: Icon(
                    suffixIcon,
                    color: kTextFiledSuffixIconColor,
                  ),
                ),
                hintText: hintText,
                hintStyle: TextStyle(color: kHintTextColor),
                contentPadding: const EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isErrorExist
                          ? kErrorColor
                          : kOutlinedTextFiledBorderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isErrorExist ? kErrorColor : kGreyColor),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        validatorList.contains(validatorErrorText)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  validatorErrorText,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
