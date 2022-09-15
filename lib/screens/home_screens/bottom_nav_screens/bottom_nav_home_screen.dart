import 'package:flutter/material.dart';
import 'package:food_delivery/constants/lists.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/screens/home_screens/see_all_screen.dart';
import 'package:food_delivery/widgets/home_screen_widgets/all_restaurant_widget.dart';
import 'package:food_delivery/widgets/home_screen_widgets/free_delivery_ad.dart';
import 'package:food_delivery/widgets/home_screen_widgets/home_screen_top_widget.dart';
import 'package:food_delivery/widgets/home_screen_widgets/horizontal_list_widget.dart';

class BottomNavHomeScreen extends StatefulWidget {
  const BottomNavHomeScreen({Key? key}) : super(key: key);
  static const String id = '/bottom_home_screen';

  @override
  State<BottomNavHomeScreen> createState() => _BottomNavHomeScreenState();
}

class _BottomNavHomeScreenState extends State<BottomNavHomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: HomeScreenTopWidget(
              currentPage: currentPage,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              imagesList: foodSliderImagesList,
            ),
          ),
          HorizontalListWidget(
              mainTitleText: kFeaturePartners,
              onPressedSeeAll: () {
                Navigator.pushNamed(context, SeeAllScreen.id,
                    arguments: {'appBarTitle': kFeaturePartners});
              },
              list: featuredPartnerList,
              scrollDirection: Axis.horizontal,
              itemsCount: 5,
              showTopTitleWidget: true),
          const FreeDeliveryAd(),
          HorizontalListWidget(
              mainTitleText: kBestPacks,
              onPressedSeeAll: () {
                Navigator.pushNamed(context, SeeAllScreen.id,
                    arguments: {'appBarTitle': kBestPacks});
              },
              list: bestPackList,
              scrollDirection: Axis.horizontal,
              itemsCount: 5,
              showTopTitleWidget: true),
          AllRestaurantWidget(
            mainTitleText: kAllRestaurants,
            onPressedSeeAll: () {
              Navigator.pushNamed(context, SeeAllScreen.id,
                  arguments: {'appBarTitle': kAllRestaurants});
            },
            list: allRestaurantList,
            itemCount: 3,
            showTopTitleWidget: true,
          ),
        ],
      ),
    );
  }
}
