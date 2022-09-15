import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/lists.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/constants/validator.dart';
import 'package:food_delivery/screens/regestration_screens/confirm_email_address_screen.dart';
import 'package:food_delivery/widgets/initial_widgets/outlined_text_field.dart';
import 'package:food_delivery/widgets/initial_widgets/rounded_rectangle_button.dart';
import 'package:food_delivery/widgets/initial_widgets/top_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const String id = '/forgot_password_screen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var emailAddress = '';
  var isErrorExistsOnEmailAddress = false,
      isForgotPasswordButtonClicked = false;

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
            kForgotPasswordNoQM,
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
                    textTitle: kForgotPassword,
                    textDecsription: kForgotPasswordDescription,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OutlinedTextField(
                    hintText: kEmailAddress,
                    onChange: (value) {
                      setState(() {
                        emailAddress = value;
                        if (isForgotPasswordButtonClicked) {
                          isErrorExistsOnEmailAddress = false;
                          if (validatorList.contains(kEmailEmptyError) ||
                              validatorList.contains(kEmailIncorrectError)) {
                            validatorList.remove(kEmailEmptyError);
                            validatorList.remove(kEmailIncorrectError);
                          }
                        }
                      });
                    },
                    isTextObsecure: false,
                    isErrorExist: isErrorExistsOnEmailAddress,
                    keyboardType: TextInputType.emailAddress,
                    validatorErrorText: emailAddress != ''
                        ? kEmailIncorrectError
                        : kEmailEmptyError,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedRectangleButton(
                    text: kRESETPASSWORD,
                    onPressed: () {
                      isForgotPasswordButtonClicked = true;
                      setState(() {
                        isErrorExistsOnEmailAddress =
                            emailValidator(emailAddress);
                        if (validatorList.isEmpty) {
                          Navigator.pushNamed(
                              context, ConfirmEmailAddressScreen.id,
                              arguments: {'emailAddress': emailAddress});
                        }
                      });
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
