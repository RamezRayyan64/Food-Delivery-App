// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/constants/strings.dart';
import 'package:food_delivery_app_ui/widgets/home_screen_widgets/horizontal_list_item_widget.dart';
import 'package:food_delivery_app_ui/widgets/home_screen_widgets/top_title_see_all_widget.dart';

class HorizontalListWidget extends StatelessWidget {
  const HorizontalListWidget(
      {Key? key,
      this.mainTitleText,
      this.onPressedSeeAll,
      this.list,
      this.scrollDirection,
      this.itemsCount,
      this.showTopTitleWidget})
      : super(key: key);
  final mainTitleText;
  final onPressedSeeAll;
  final list;
  final scrollDirection;
  final itemsCount;
  final showTopTitleWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showTopTitleWidget
            ? TopTitleWidget(
                titleText: mainTitleText,
                onPressedSeeAll: onPressedSeeAll,
                text: kSeeAll,
                textColor: kGreenColor,
              )
            : const SizedBox(),
        SingleChildScrollView(
          scrollDirection: scrollDirection,
          child: scrollDirection == Axis.horizontal
              ? Row(
                  children: List.generate(itemsCount, (index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: index == 0 ? 10 : 0, right: 15),
                      child: HorizontalListItemWidget(
                        itemWidth: 200,
                        index: index,
                        imageSource: list[index]['imageSource'],
                        titleText: list[index]['titleText'],
                        subTitleText: list[index]['subTitleText'],
                        ratingStar: list[index]['ratingStar'],
                        timeText: list[index]['timeText'],
                        deliveryType: list[index]['deliveryType'],
                        imageHeight: 150,
                      ),
                    );
                  }),
                )
              : Column(
                  children: List.generate(itemsCount, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 15),
                      child: HorizontalListItemWidget(
                        itemWidth: double.infinity,
                        index: index,
                        imageSource: list[index]['imageSource'],
                        titleText: list[index]['titleText'],
                        subTitleText: list[index]['subTitleText'],
                        ratingStar: list[index]['ratingStar'],
                        timeText: list[index]['timeText'],
                        deliveryType: list[index]['deliveryType'],
                        imageHeight: 200,
                      ),
                    );
                  }),
                ),
        )
      ],
    );
  }
}
