// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ViewPagerDots extends StatelessWidget {
  const ViewPagerDots({
    Key? key,
    this.index,
    this.currentPage,
    this.selectedColor,
    this.unSelectedColor,
  }) : super(key: key);
  final index;
  final currentPage;
  final selectedColor;
  final unSelectedColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.all(4),
      height: 5,
      width: currentPage == index ? 20 : 5,
      decoration: BoxDecoration(
          color: currentPage == index ? selectedColor : unSelectedColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
