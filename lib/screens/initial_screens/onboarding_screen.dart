import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/lists.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/screens/regestration_screens/sign_in_screen.dart';
import 'package:food_delivery/widgets/initial_widgets/rounded_rectangle_button.dart';
import 'package:food_delivery/widgets/initial_widgets/view_pager.dart';
import 'package:food_delivery/widgets/initial_widgets/view_pager_dots.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static const String id = '/onboarding_screen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: kWhiteColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: kWhiteColor,
        systemNavigationBarDividerColor: kWhiteColor,
        systemNavigationBarIconBrightness: Brightness.dark));
  }

  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                    itemCount: onboardingDetailsList.length,
                    itemBuilder: (context, index) {
                      return ViewPager(
                        imageSource: onboardingDetailsList[index]
                            ['imageSource'],
                        titleText: onboardingDetailsList[index]['title'],
                        descriptionText: onboardingDetailsList[index]
                            ['description'],
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(onboardingDetailsList.length,
                              (index) {
                            return ViewPagerDots(
                              index: index,
                              currentPage: currentPage,
                              selectedColor: kGreenColor,
                              unSelectedColor: kGreyColor,
                            );
                          })),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: RoundedRectangleButton(
                          text: kGETSTARTED,
                          onPressed: () async {
                            Navigator.pushNamedAndRemoveUntil(
                                context, SignInScreen.id, (route) => false);
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setBool('onboardingStatus', true);
                          },
                          backgroundColor: kGreenColor,
                        ),
                      ),
                      const Spacer(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
