import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/constants/lists.dart';
import 'package:food_delivery_app_ui/constants/strings.dart';
import 'package:food_delivery_app_ui/constants/validator.dart';
import 'package:food_delivery_app_ui/screens/home_screens/home_screen.dart';
import 'package:food_delivery_app_ui/widgets/initial_widgets/otp_outlined_textfield.dart';
import 'package:food_delivery_app_ui/widgets/initial_widgets/rounded_rectangle_button.dart';
import 'package:food_delivery_app_ui/widgets/initial_widgets/top_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmPhoneNumberScreen extends StatefulWidget {
  const ConfirmPhoneNumberScreen({Key? key}) : super(key: key);
  static const String id = '/confirm_phone_number_screen';

  @override
  State<ConfirmPhoneNumberScreen> createState() =>
      _ConfirmPhoneNumberScreenState();
}

class _ConfirmPhoneNumberScreenState extends State<ConfirmPhoneNumberScreen> {
  List<FocusNode> textFiledFocusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];
  bool isErrorExistsOnFirstCodeDigitTextFiled = false,
      isErrorExistsOnSecondCodeDigitTextFiled = false,
      isErrorExistsOnThirdCodeDigitTextFiled = false,
      isErrorExistsOnFourthCodeDigitTextFiled = false,
      isErrorExistsOnFifthCodeDigitTextFiled = false,
      isErrorExistsOnSixthCodeDigitTextFiled = false,
      isContinueButtonClicked = false;
  // ignore: prefer_typing_uninitialized_variables
  var map;
  var phoneNumber = '',
      firstCodeDigit = '',
      secondCodeDigit = '',
      thirdCodeDigit = '',
      fourthCodeDigit = '',
      fifthCodeDigit = '',
      sixthCodeDigit = '';

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
    map = ModalRoute.of(context)!.settings.arguments;
    phoneNumber = map['phoneNumber'];
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
                  TopTextWidget(
                    textTitle: kVerifyPhoneNumber,
                    textDecsription:
                        '$kVerifyPhoneNumberTopTextsTitle $phoneNumber',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    children: [
                      OTPOutlinedTextField(
                        focusNode: textFiledFocusNodes[0],
                        onChanged: (value) {
                          firstCodeDigit = value;
                          if (value != '') {
                            textFiledFocusNodes[0].unfocus();
                            textFiledFocusNodes[1].requestFocus();
                          }
                          if (isContinueButtonClicked) {
                            isErrorExistsOnFirstCodeDigitTextFiled = false;
                          }
                        },
                        isErrorExists: isErrorExistsOnFirstCodeDigitTextFiled,
                      ),
                      OTPOutlinedTextField(
                        focusNode: textFiledFocusNodes[1],
                        onChanged: (value) {
                          secondCodeDigit = value;
                          if (value != '') {
                            textFiledFocusNodes[1].unfocus();
                            textFiledFocusNodes[2].requestFocus();
                          }
                          if (isContinueButtonClicked) {
                            isErrorExistsOnSecondCodeDigitTextFiled = false;
                          }
                        },
                        isErrorExists: isErrorExistsOnSecondCodeDigitTextFiled,
                      ),
                      OTPOutlinedTextField(
                        focusNode: textFiledFocusNodes[2],
                        onChanged: (value) {
                          thirdCodeDigit = value;
                          if (value != '') {
                            textFiledFocusNodes[2].unfocus();
                            textFiledFocusNodes[3].requestFocus();
                          }
                          if (isContinueButtonClicked) {
                            isErrorExistsOnThirdCodeDigitTextFiled = false;
                          }
                        },
                        isErrorExists: isErrorExistsOnThirdCodeDigitTextFiled,
                      ),
                      OTPOutlinedTextField(
                        focusNode: textFiledFocusNodes[3],
                        onChanged: (value) {
                          fourthCodeDigit = value;
                          if (value != '') {
                            textFiledFocusNodes[3].unfocus();
                            textFiledFocusNodes[4].requestFocus();
                          }
                          if (isContinueButtonClicked) {
                            isErrorExistsOnFourthCodeDigitTextFiled = false;
                          }
                        },
                        isErrorExists: isErrorExistsOnFourthCodeDigitTextFiled,
                      ),
                      OTPOutlinedTextField(
                        focusNode: textFiledFocusNodes[4],
                        onChanged: (value) {
                          fifthCodeDigit = value;
                          if (value != '') {
                            textFiledFocusNodes[4].unfocus();
                            textFiledFocusNodes[5].requestFocus();
                          }
                          if (isContinueButtonClicked) {
                            isErrorExistsOnFifthCodeDigitTextFiled = false;
                          }
                        },
                        isErrorExists: isErrorExistsOnFifthCodeDigitTextFiled,
                      ),
                      OTPOutlinedTextField(
                        focusNode: textFiledFocusNodes[5],
                        onChanged: (value) {
                          sixthCodeDigit = value;
                          if (value != '') {
                            textFiledFocusNodes[5].unfocus();
                          }
                          if (isContinueButtonClicked) {
                            isErrorExistsOnSixthCodeDigitTextFiled = false;
                          }
                        },
                        isErrorExists: isErrorExistsOnSixthCodeDigitTextFiled,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedRectangleButton(
                    text: kCONTINUE,
                    onPressed: () async {
                      // isContinueButtonClicked = true;
                      // setState(() {
                      //   isErrorExistsOnFirstCodeDigitTextFiled =
                      //       codeDigitValidator(firstCodeDigit);
                      //   isErrorExistsOnSecondCodeDigitTextFiled =
                      //       codeDigitValidator(secondCodeDigit);
                      //   isErrorExistsOnThirdCodeDigitTextFiled =
                      //       codeDigitValidator(thirdCodeDigit);
                      //   isErrorExistsOnFourthCodeDigitTextFiled =
                      //       codeDigitValidator(fourthCodeDigit);
                      //   isErrorExistsOnFifthCodeDigitTextFiled =
                      //       codeDigitValidator(fifthCodeDigit);
                      //   isErrorExistsOnSixthCodeDigitTextFiled =
                      //       codeDigitValidator(sixthCodeDigit);
                      // });
                      // if (!(isErrorExistsOnFirstCodeDigitTextFiled &&
                      //     isErrorExistsOnSecondCodeDigitTextFiled &&
                      //     isErrorExistsOnThirdCodeDigitTextFiled &&
                      //     isErrorExistsOnFourthCodeDigitTextFiled &&
                      //     isErrorExistsOnFifthCodeDigitTextFiled &&
                      //     isErrorExistsOnSixthCodeDigitTextFiled)) {
                      // SharedPreferences sharedPreferences =
                      //     await SharedPreferences.getInstance();
                      // sharedPreferences.setBool('isUserSignedIn', true);
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.id, (route) => false);
                      // }
                    },
                    backgroundColor: kGreenColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        kDidntReceiveCode,
                        style: TextStyle(fontSize: 16, color: kGreyColor),
                      ),
                      TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  kButtonOverlayColor)),
                          child: const Text(
                            kResendAgain,
                            style: TextStyle(fontSize: 16),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Text(
                        kAgreeToOurTerms,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: kGreyColor),
                      ),
                    ),
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
