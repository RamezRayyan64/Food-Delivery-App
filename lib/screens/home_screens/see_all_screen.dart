import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/lists.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/widgets/home_screen_widgets/all_restaurant_widget.dart';
import 'package:food_delivery/widgets/home_screen_widgets/horizontal_list_widget.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({Key? key}) : super(key: key);
  static const String id = '/see_all_screen';

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  var map;

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    String appBarTitle = map['appBarTitle'];
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: kBlackColor,
            ),
          ),
          backgroundColor: kWhiteColor,
          title: Text(
            appBarTitle,
            style: const TextStyle(color: kBlackColor),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: appBarTitle == kFeaturePartners
                ? HorizontalListWidget(
                    mainTitleText: kFeaturePartners,
                    onPressedSeeAll: () {
                      Navigator.pushNamed(context, SeeAllScreen.id,
                          arguments: {'appBarTitle': kFeaturePartners});
                    },
                    list: featuredPartnerList,
                    scrollDirection: Axis.vertical,
                    itemsCount: featuredPartnerList.length,
                    showTopTitleWidget: false)
                : appBarTitle == kBestPacks
                    ? HorizontalListWidget(
                        mainTitleText: kBestPacks,
                        onPressedSeeAll: () {
                          Navigator.pushNamed(context, SeeAllScreen.id,
                              arguments: {'appBarTitle': kBestPacks});
                        },
                        list: bestPackList,
                        scrollDirection: Axis.vertical,
                        itemsCount: bestPackList.length,
                        showTopTitleWidget: false)
                    : AllRestaurantWidget(
                        mainTitleText: appBarTitle,
                        onPressedSeeAll: () {
                          Navigator.pushNamed(context, SeeAllScreen.id);
                        },
                        list: allRestaurantList,
                        itemCount: allRestaurantList.length,
                        showTopTitleWidget: false,
                      )),
      ),
    );
  }
}
