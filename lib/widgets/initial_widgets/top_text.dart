// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TopTextWidget extends StatelessWidget {
  const TopTextWidget({Key? key, this.textTitle, this.textDecsription})
      : super(key: key);
  final textTitle;
  final textDecsription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTitle,
          style: const TextStyle(fontSize: 40, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(right: 100),
          child: Text(
            textDecsription,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
