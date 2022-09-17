import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/screens/home_screens/home_screen.dart';
import 'package:food_delivery_app_ui/screens/initial_screens/onboarding_screen.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('onboardingStatus') == null) {
      Navigator.pushNamedAndRemoveUntil(
          context, OnboardingScreen.id, (route) => false);
    } else {
      if (sharedPreferences.getBool('isUserSignedIn') == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, SignInScreen.id, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.id, (route) => false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark));
    Future.delayed(const Duration(seconds: 3), () {
      checkStatus();
    });
  }

//delete this
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
          backgroundColor: kWhiteColor,
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/others/splash_screen_image1.jpg'))),
              ),
              const Center(
                child: Text(
                  "Food Delivery\nApp",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: kWhiteColor),
                ),
              ),
              // Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       TextButton(
              //           onPressed: () {
              //             showModalBottomSheet(
              //                 context: context,
              //                 builder: (context) {
              //                   return Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: [
              //                       ListTile(
              //                         leading: const Icon(Icons.link),
              //                         title: const Text('Link'),
              //                         onTap: () {},
              //                       ),
              //                       ListTile(
              //                         leading: const Icon(Icons.share),
              //                         title: const Text('Share'),
              //                         onTap: () {
              //                           Navigator.pop(context);
              //                         },
              //                       ),
              //                     ],
              //                   );
              //                 });
              //           },
              //           child: const Text('Modal Bottom Sheet')),
              //       TextButton(
              //           onPressed: () {
              //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //               content: const Text('Shared'),
              //               action:
              //                   SnackBarAction(label: 'Undo', onPressed: () {}),
              //             ));
              //           },
              //           child: const Text('Snackbar Message')),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Container(
              //             width: 50,
              //             height: 50,
              //             decoration: BoxDecoration(
              //                 color: Colors.red.withOpacity(.8),
              //                 shape: BoxShape.circle),
              //           ),
              //           Transform.translate(
              //             offset: Offset(-15, 0),
              //             child: Container(
              //               width: 50,
              //               height: 50,
              //               decoration: BoxDecoration(
              //                   color: Colors.orange.withOpacity(0.8),
              //                   shape: BoxShape.circle),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          )),
    );
  }
}
