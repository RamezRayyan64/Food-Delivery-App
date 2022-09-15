// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/widgets/initial_widgets/view_pager_dots.dart';

class HomeScreenTopWidget extends StatelessWidget {
  const HomeScreenTopWidget(
      {Key? key, this.onPageChanged, this.currentPage, this.imagesList})
      : super(key: key);
  final onPageChanged;
  final currentPage;
  final imagesList;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: 200,
        child: PageView.builder(
          itemCount: imagesList.length,
          itemBuilder: (context, index) {
            return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/foods/${imagesList[index]}.jpg'))));
          },
          onPageChanged: onPageChanged,
        ),
      ),
      Positioned(
          right: 20,
          bottom: 10,
          child: Row(
            children: List.generate(imagesList.length, (index) {
              return ViewPagerDots(
                index: index,
                currentPage: currentPage,
                selectedColor: kWhiteColor,
                unSelectedColor: kGreyColor,
              );
            }),
          ))
    ]);
  }
}
