import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/constants/lists.dart';
import 'package:food_delivery_app_ui/constants/strings.dart';
import 'package:food_delivery_app_ui/constants/validator.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/sign_in_screen.dart';
import 'package:food_delivery_app_ui/widgets/initial_widgets/outlined_text_field.dart';
import 'package:food_delivery_app_ui/widgets/initial_widgets/rounded_rectangle_button.dart';
import 'package:food_delivery_app_ui/widgets/initial_widgets/top_text.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);
  static const String id = '/change_password_screen';

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var newPassword = '', confirmNewPassword = '';
  var isErrorExistsOnNewPassword = false,
      isErrorExistsOnConfirmNewPassword = false,
      isForgotPasswordButtonClicked = false,
      isNewPasswordVisible = false,
      isConfirmNewPasswordVisible = false;

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
            kChangePassword,
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
                    textTitle: kChangePassword,
                    textDecsription: kChangePasswordTopTextsDescription,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OutlinedTextField(
                    hintText: kNewPassword,
                    onChange: (value) {
                      setState(() {
                        newPassword = value;
                        if (isForgotPasswordButtonClicked) {
                          isErrorExistsOnNewPassword = false;
                          if (validatorList.contains(kNewPasswordEmptyError) ||
                              validatorList
                                  .contains(kNewPasswordIncorrectError)) {
                            validatorList.remove(kNewPasswordEmptyError);
                            validatorList.remove(kNewPasswordIncorrectError);
                          }
                        }
                      });
                    },
                    isTextObsecure: !isNewPasswordVisible,
                    suffixIcon: isNewPasswordVisible
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    suffixIconOnTap: () {
                      setState(() {
                        isNewPasswordVisible = !isNewPasswordVisible;
                      });
                    },
                    isErrorExist: isErrorExistsOnNewPassword,
                    keyboardType: TextInputType.emailAddress,
                    validatorErrorText: newPassword != ''
                        ? kNewPasswordIncorrectError
                        : kNewPasswordEmptyError,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedTextField(
                    hintText: kConfirmNewPassword,
                    onChange: (value) {
                      setState(() {
                        confirmNewPassword = value;
                        if (isForgotPasswordButtonClicked) {
                          isErrorExistsOnConfirmNewPassword = false;
                          if (validatorList
                                  .contains(kConfirmNewPasswordEmptyError) ||
                              validatorList.contains(
                                  kConfirmNewPasswordIncorrectError)) {
                            validatorList.remove(kConfirmNewPasswordEmptyError);
                            validatorList
                                .remove(kConfirmNewPasswordIncorrectError);
                          }
                        }
                      });
                    },
                    isTextObsecure: !isConfirmNewPasswordVisible,
                    suffixIcon: isConfirmNewPasswordVisible
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    suffixIconOnTap: () {
                      setState(() {
                        isConfirmNewPasswordVisible =
                            !isConfirmNewPasswordVisible;
                      });
                    },
                    isErrorExist: isErrorExistsOnConfirmNewPassword,
                    keyboardType: TextInputType.emailAddress,
                    validatorErrorText: confirmNewPassword != ''
                        ? kConfirmNewPasswordIncorrectError
                        : kConfirmNewPasswordEmptyError,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedRectangleButton(
                    text: kRESETPASSWORD,
                    onPressed: () {
                      isForgotPasswordButtonClicked = true;
                      setState(() {
                        isErrorExistsOnNewPassword = passwordValidator(
                            newPassword,
                            kNewPasswordEmptyError,
                            kNewPasswordIncorrectError);
                        isErrorExistsOnConfirmNewPassword = passwordValidator(
                            confirmNewPassword,
                            kConfirmNewPasswordEmptyError,
                            kConfirmNewPasswordIncorrectError);
                        if (validatorList.isEmpty) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, SignInScreen.id, (route) => false);
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
