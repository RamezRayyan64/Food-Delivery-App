import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/lists.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/constants/validator.dart';
import 'package:food_delivery/screens/regestration_screens/phone_number_screen.dart';
import 'package:food_delivery/screens/regestration_screens/sign_in_screen.dart';
import 'package:food_delivery/widgets/initial_widgets/other_button.dart';
import 'package:food_delivery/widgets/initial_widgets/outlined_text_field.dart';
import 'package:food_delivery/widgets/initial_widgets/rounded_rectangle_button.dart';
import 'package:food_delivery/widgets/initial_widgets/top_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String id = '/sign_up_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var isPasswordVisible = false,
      isConfirmPasswordVisible = false,
      isSignedUpButtonClicked = false,
      isErrorExistsOnName = false,
      isErrorExistsOnEmailAddress = false,
      isErrorExistsOnPassword = false,
      isErrorExistsOnConfirmPassword = false,
      isErrorExistsOnMatchPasswords = false;
  var name = '', emailAddress = '', password = '', confirmPassword = '';

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
              kSignUp,
              style: TextStyle(color: kBlackColor),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const TopTextWidget(
                      textTitle: kCreateAccount,
                      textDecsription: kSignUpDescription,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    OutlinedTextField(
                      hintText: kName,
                      onChange: (value) {
                        setState(() {
                          name = value;
                          if (isSignedUpButtonClicked) {
                            isErrorExistsOnName = false;
                            if (validatorList.contains(kNameEmptyError) ||
                                validatorList.contains(kNameIncorrectError)) {
                              validatorList.remove(kNameEmptyError);
                              validatorList.remove(kNameIncorrectError);
                            }
                          }
                        });
                      },
                      isTextObsecure: false,
                      keyboardType: TextInputType.text,
                      isErrorExist: isErrorExistsOnName,
                      validatorErrorText:
                          name != '' ? kNameIncorrectError : kNameEmptyError,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedTextField(
                      hintText: kEmailAddress,
                      onChange: (value) {
                        setState(() {
                          emailAddress = value;
                          if (isSignedUpButtonClicked) {
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
                      height: 10,
                    ),
                    OutlinedTextField(
                      hintText: kPassword,
                      onChange: (value) {
                        setState(() {
                          password = value;
                          if (isSignedUpButtonClicked) {
                            isErrorExistsOnPassword = false;
                            if (validatorList.contains(kPasswordEmptyError) ||
                                validatorList
                                    .contains(kPasswordIncorrectError)) {
                              validatorList.remove(kPasswordEmptyError);
                              validatorList.remove(kPasswordIncorrectError);
                            }
                            if (isErrorExistsOnMatchPasswords) {
                              isErrorExistsOnPassword = false;
                              isErrorExistsOnConfirmPassword = false;
                            }
                          }
                        });
                      },
                      isTextObsecure: !isPasswordVisible,
                      keyboardType: TextInputType.text,
                      suffixIcon: isPasswordVisible
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      suffixIconOnTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      isErrorExist: isErrorExistsOnPassword,
                      validatorErrorText: password != ''
                          ? kPasswordIncorrectError
                          : kPasswordEmptyError,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedTextField(
                      hintText: kConfirmPassword,
                      onChange: (value) {
                        confirmPassword = value;
                        setState(() {
                          confirmPassword = value;
                          if (isSignedUpButtonClicked) {
                            isErrorExistsOnConfirmPassword = false;
                            if (validatorList
                                    .contains(kConfirmPasswordEmptyError) ||
                                validatorList
                                    .contains(kConfirmPasswordIncorrectError)) {
                              validatorList.remove(kConfirmPasswordEmptyError);
                              validatorList
                                  .remove(kConfirmPasswordIncorrectError);
                            }
                            if (isErrorExistsOnMatchPasswords) {
                              isErrorExistsOnPassword = false;
                              isErrorExistsOnConfirmPassword = false;
                            }
                          }
                        });
                      },
                      isTextObsecure: !isConfirmPasswordVisible,
                      keyboardType: TextInputType.text,
                      suffixIcon: isConfirmPasswordVisible
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      suffixIconOnTap: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                      isErrorExist: isErrorExistsOnConfirmPassword,
                      validatorErrorText: confirmPassword != ''
                          ? !password.contains(confirmPassword)
                              ? kPasswordMatchIncorrectError
                              : kConfirmPasswordIncorrectError
                          : kConfirmPasswordEmptyError,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundedRectangleButton(
                      text: kSIGNUP,
                      onPressed: () {
                        isSignedUpButtonClicked = true;
                        // setState(() {
                        //   isErrorExistsOnName = nameValidator(name);
                        //   isErrorExistsOnEmailAddress =
                        //       emailValidator(emailAddress);
                        //   isErrorExistsOnPassword = passwordValidator(password,
                        //       kPasswordEmptyError, kPasswordIncorrectError);
                        //   isErrorExistsOnConfirmPassword =
                        //       confirmPasswordValidator(confirmPassword);
                        //   if (password != '' && confirmPassword != '') {
                        //     isErrorExistsOnMatchPasswords =
                        //         passwordsMatchValidator(
                        //             password, confirmPassword);
                        //     if (isErrorExistsOnMatchPasswords) {
                        //       isErrorExistsOnPassword = true;
                        //       isErrorExistsOnConfirmPassword = true;
                        //     }
                        //   }
                        // });
                        // if (validatorList.isEmpty) {
                        Navigator.pushNamed(context, PhoneNumberScreen.id);
                        // },
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
                          kAlreadyHaveAccount,
                          style: TextStyle(fontSize: 16, color: kGreyColor),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, SignInScreen.id, (route) => false);
                            },
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    kButtonOverlayColor)),
                            child: const Text(
                              kSignIn,
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        kOr,
                        style: TextStyle(fontSize: 16, color: kGreyColor),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OtherButton(
                      onPressedFaceBook: () {},
                      onPressedGoogle: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
