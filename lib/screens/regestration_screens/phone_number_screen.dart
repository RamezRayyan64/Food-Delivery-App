// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/lists.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/constants/validator.dart';
import 'package:food_delivery/screens/regestration_screens/confirm_phone_number_screen.dart';
import 'package:food_delivery/widgets/initial_widgets/outlined_text_field.dart';
import 'package:food_delivery/widgets/initial_widgets/rounded_rectangle_button.dart';
import 'package:food_delivery/widgets/initial_widgets/top_text.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);
  static const String id = '/phone_number_screen';

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  var phoneNumber = '';
  var isErrorExistsOnPhoneNumber = false, isSignUpButtonClicked = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        validatorList.clear();
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              validatorList.clear();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: kBlackColor,
            ),
          ),
          title: const Text(
            kPhoneNumberAppBarTitle,
            style: TextStyle(color: kBlackColor),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const TopTextWidget(
                    textTitle: kPhoneNumberTopTextsTitle,
                    textDecsription: kPhoneNumberTopTextsDescription,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OutlinedTextField(
                    hintText: kPhoneNumber,
                    onChange: (value) {
                      setState(() {
                        phoneNumber = value;
                        if (isSignUpButtonClicked) {
                          isErrorExistsOnPhoneNumber = false;
                          if (validatorList.contains(kPhoneNumberEmptyError) ||
                              validatorList
                                  .contains(kPhoneNumberIncorrectError)) {
                            validatorList.remove(kPhoneNumberEmptyError);
                            validatorList.remove(kPhoneNumberIncorrectError);
                          }
                        }
                      });
                    },
                    isTextObsecure: false,
                    keyboardType: TextInputType.phone,
                    isErrorExist: isErrorExistsOnPhoneNumber,
                    validatorErrorText: phoneNumber != ''
                        ? kPhoneNumberIncorrectError
                        : kPhoneNumberEmptyError,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedRectangleButton(
                    text: kVERIFYPHONENUMBER,
                    onPressed: () {
                      // isSignUpButtonClicked = true;
                      // setState(() {
                      //   isErrorExistsOnPhoneNumber =
                      //       phoneNumberValidator(phoneNumber);
                      // });
                      // if (validatorList.isEmpty) {
                      //   if (phoneNumber.startsWith('0093')) {
                      //     phoneNumber = phoneNumber.replaceFirst('0093', '+93');
                      //   } else if (phoneNumber.startsWith('0')) {
                      //     phoneNumber = phoneNumber.replaceFirst('0', '+93');
                      //   }
                      Navigator.pushNamed(context, ConfirmPhoneNumberScreen.id,
                          arguments: {
                            'phoneNumber': phoneNumber,
                          });
                      // }
                    },
                    backgroundColor: kGreenColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
