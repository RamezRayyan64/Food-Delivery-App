// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/widgets/home_screen_widgets/home_screen_top_widget.dart';
import 'package:food_delivery/widgets/home_screen_widgets/top_title_see_all_widget.dart';

// ignore: must_be_immutable
class AllRestaurantWidget extends StatefulWidget {
  AllRestaurantWidget({
    Key? key,
    this.mainTitleText,
    this.onPressedSeeAll,
    this.list,
    this.itemCount,
    this.showTopTitleWidget,
    this.currentPage,
  }) : super(key: key);
  final mainTitleText;
  final onPressedSeeAll;
  final list;
  final itemCount;
  final showTopTitleWidget;
  int? currentPage;

  @override
  State<AllRestaurantWidget> createState() => _AllRestaurantWidgetState();
}

class _AllRestaurantWidgetState extends State<AllRestaurantWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.showTopTitleWidget
            ? TopTitleWidget(
                titleText: widget.mainTitleText,
                onPressedSeeAll: widget.onPressedSeeAll,
                text: kSeeAll,
                textColor: kGreenColor,
              )
            : const SizedBox(),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(widget.itemCount, (parentIndex) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeScreenTopWidget(
                      currentPage: widget.list[parentIndex]
                          ['sliderImageCurrentIndex'],
                      onPageChanged: (index) {
                        setState(() {
                          widget.list[parentIndex]['sliderImageCurrentIndex'] =
                              index;
                        });
                      },
                      imagesList: widget.list[parentIndex]['sliderImages'],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.list[parentIndex]['titleText'],
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.list[parentIndex]['dollorSignText'],
                            style: const TextStyle(
                                fontSize: 16, color: kGreyColor),
                          ),
                          Container(
                            height: 3,
                            width: 3,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black54),
                          ),
                          Text(
                            widget.list[parentIndex]['firstFoodTypeText'],
                            style: const TextStyle(
                                fontSize: 16, color: kGreyColor),
                          ),
                          Container(
                            height: 3,
                            width: 3,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black54),
                          ),
                          Text(
                            widget.list[parentIndex]['secondFoodTypeText'],
                            style: const TextStyle(
                                fontSize: 16, color: kGreyColor),
                          ),
                          Container(
                            height: 3,
                            width: 3,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black54),
                          ),
                          Text(
                            widget.list[parentIndex]['thirdFoodTypeText'],
                            style: const TextStyle(
                                fontSize: 16, color: kGreyColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.list[parentIndex]['ratingStarText'],
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.star,
                          color: kGreenColor,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                            '${widget.list[parentIndex]['ratingCountText']} Rating',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54)),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.access_time_filled,
                          color: Colors.black54,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(widget.list[parentIndex]['timeText'],
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
                        const Icon(
                          Icons.attach_money_rounded,
                          color: Colors.black54,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(widget.list[parentIndex]['foodDeliveryTypeText'],
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54))
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
