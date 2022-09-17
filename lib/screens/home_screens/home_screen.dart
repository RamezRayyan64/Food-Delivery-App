import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/constants/lists.dart';
import 'package:food_delivery_app_ui/constants/strings.dart';
import 'package:food_delivery_app_ui/screens/home_screens/filter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  int currentBNVIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          centerTitle: true,
          elevation: 0,
          title: Column(
            children: const [
              Text(
                kDeliveryTo,
                style: TextStyle(color: kGreenColor, fontSize: 16),
              ),
              Text(
                kSanFrancisco,
                style: TextStyle(color: kBlackColor),
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, FilterScreen.id);
                },
                child: const Text(
                  kFilter,
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                )),
          ],
        ),
        body: bottomNavScreen[currentBNVIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentBNVIndex,
          onTap: (index) {
            setState(() {
              currentBNVIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: kGreenColor,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Orders',
              icon: Icon(Icons.square),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }
}
