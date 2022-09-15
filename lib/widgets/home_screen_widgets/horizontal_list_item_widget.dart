// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';

class HorizontalListItemWidget extends StatelessWidget {
  const HorizontalListItemWidget({
    Key? key,
    this.index,
    this.titleText,
    this.subTitleText,
    this.ratingStar,
    this.timeText,
    this.deliveryType,
    this.imageSource,
    required this.itemWidth,
    required this.imageHeight,
  }) : super(key: key);
  final index;
  final imageSource;
  final titleText;
  final subTitleText;
  final ratingStar;
  final timeText;
  final deliveryType;
  final double itemWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              height: imageHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage('assets/images/foods/$imageSource.jpg')))),
          const SizedBox(
            height: 5,
          ),
          Text(
            titleText,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              subTitleText,
              style: const TextStyle(fontSize: 16, color: kGreyColor),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: kGreenColor),
                child: Text(
                  ratingStar,
                  style: const TextStyle(fontSize: 14, color: kWhiteColor),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 5),
                child: Row(
                  children: [
                    Text(timeText,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54)),
                    Container(
                      height: 3,
                      width: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black54),
                    ),
                    Text(deliveryType,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54)),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
