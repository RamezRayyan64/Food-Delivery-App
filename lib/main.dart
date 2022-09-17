import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/screens/home_screens/bottom_nav_screens/bottom_nav_profile_screen.dart';
import 'package:food_delivery_app_ui/screens/home_screens/bottom_nav_screens/bottom_nav_home_screen.dart';
import 'package:food_delivery_app_ui/screens/home_screens/bottom_nav_screens/bottom_nav_orders_screen.dart';
import 'package:food_delivery_app_ui/screens/home_screens/bottom_nav_screens/bottom_nav_search_screen.dart';
import 'package:food_delivery_app_ui/screens/home_screens/filter_screen.dart';
import 'package:food_delivery_app_ui/screens/home_screens/home_screen.dart';
import 'package:food_delivery_app_ui/screens/home_screens/see_all_screen.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/change_password_screen.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/confirm_email_address_screen.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/confirm_phone_number_screen.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/forgot_password_screen.dart';
import 'package:food_delivery_app_ui/screens/initial_screens/onboarding_screen.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/phone_number_screen.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/sign_in_screen.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/sign_up_screen.dart';
import 'package:food_delivery_app_ui/screens/initial_screens/splash_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
      )),
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        OnboardingScreen.id: (context) => const OnboardingScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        PhoneNumberScreen.id: (context) => const PhoneNumberScreen(),
        ConfirmPhoneNumberScreen.id: (context) =>
            const ConfirmPhoneNumberScreen(),
        ChangePasswordScreen.id: (context) => const ChangePasswordScreen(),
        ConfirmEmailAddressScreen.id: (context) =>
            const ConfirmEmailAddressScreen(),
        SeeAllScreen.id: (context) => const SeeAllScreen(),
        BottomNavHomeScreen.id: (context) => const BottomNavHomeScreen(),
        BottomNavSearchScreen.id: (context) => const BottomNavSearchScreen(),
        BottomNavOrderScreen.id: (context) => const BottomNavOrderScreen(),
        BottomNavProfileScreen.id: (context) => const BottomNavProfileScreen(),
        FilterScreen.id: (context) => const FilterScreen(),
      },
    );
  }
}
