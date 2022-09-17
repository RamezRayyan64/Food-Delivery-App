import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/constants/lists.dart';
import 'package:food_delivery_app_ui/constants/strings.dart';
import 'package:food_delivery_app_ui/screens/home_screens/home_screen.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/forgot_password_screen.dart';
import 'package:food_delivery_app_ui/screens/regestration_screens/sign_up_screen.dart';
import 'package:food_delivery_app_ui/widgets/initial_widgets/other_button.dart';
import 'package:food_delivery_app_ui/widgets/initial_widgets/outlined_text_field.dart';
import 'package:food_delivery_app_ui/widgets/initial_widgets/rounded_rectangle_button.dart';
import 'package:food_delivery_app_ui/widgets/initial_widgets/top_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const String id = '/sign_in_screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var isPasswordVisible = false,
      isErrorExistsOnEmailAddress = false,
      isErrorExistsOnPassword = false,
      isSignInButtonClicked = false;
  var emailAddress = '', password = '';

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
          //exit dialog
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: kWhiteColor,
          appBar: AppBar(
            backgroundColor: kWhiteColor,
            title: const Text(
              kSignIn,
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
                      textTitle: kSignIn,
                      textDecsription: kSignInDescription,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    OutlinedTextField(
                        hintText: kEmailAddress,
                        onChange: (value) {
                          setState(() {
                            emailAddress = value;
                            if (isSignInButtonClicked) {
                              isErrorExistsOnEmailAddress = false;
                              if (validatorList.contains(kEmailEmptyError) ||
                                  validatorList
                                      .contains(kEmailIncorrectError)) {
                                validatorList.remove(kEmailEmptyError);
                                validatorList.remove(kEmailIncorrectError);
                              }
                            }
                          });
                        },
                        isTextObsecure: false,
                        keyboardType: TextInputType.emailAddress,
                        isErrorExist: isErrorExistsOnEmailAddress,
                        validatorErrorText: emailAddress != ''
                            ? kEmailIncorrectError
                            : kEmailEmptyError),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedTextField(
                        hintText: kPassword,
                        onChange: (value) {
                          setState(() {
                            password = value;
                            if (isSignInButtonClicked) {
                              isErrorExistsOnPassword = false;
                              if (validatorList.contains(kPasswordEmptyError) ||
                                  validatorList
                                      .contains(kPasswordIncorrectError)) {
                                validatorList.remove(kPasswordEmptyError);
                                validatorList.remove(kPasswordIncorrectError);
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
                            : kPasswordEmptyError),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ForgotPasswordScreen.id);
                          },
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.grey.shade50)),
                          child: const Text(
                            kForgotPassword,
                            style: TextStyle(color: kGreyColor, fontSize: 16),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RoundedRectangleButton(
                      text: kSIGNIN,
                      onPressed: () async {
                        isSignInButtonClicked = true;
                        // setState(() {
                        //   isErrorExistsOnEmailAddress =
                        //       emailValidator(emailAddress);
                        //   isErrorExistsOnPassword = passwordValidator(password,
                        //       kPasswordEmptyError, kPasswordIncorrectError);
                        // });
                        // if (validatorList.isEmpty) {
                        //   SharedPreferences sharedPreferences =
                        //       await SharedPreferences.getInstance();
                        //   sharedPreferences.setBool('isUserSignedIn', true);
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.id, (route) => false);
                        // }
                      },
                      backgroundColor: kGreenColor,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          kDontHaveAccount,
                          style: TextStyle(fontSize: 16, color: kGreyColor),
                        ),
                        TextButton(
                            onPressed: () {
                              validatorList.clear();
                              Navigator.pushNamed(context, SignUpScreen.id);
                            },
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    kButtonOverlayColor)),
                            child: const Text(
                              kCreateNewAccount,
                              style: TextStyle(fontSize: 16),
                            )),
                      ],
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
