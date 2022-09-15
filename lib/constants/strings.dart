import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

const String kAppName = 'Food Delivery App';
const String kGETSTARTED = 'GET STARTED';
const String kSignIn = 'Sign In';
const String kWelcomeTo = 'Welcome to';
const String kSignInDescription =
    'Enter your Phone number or Email address for sign in. Enjoy your food :)';
const String kEmailAddress = 'Email Address';
const String kPassword = 'Password';
const String kForgotPassword = 'Forgot Password?';
const String kSIGNIN = 'SIGN IN';
const String kOr = 'Or';
const String kCreateNewAccount = 'Create new account';
const String kDontHaveAccount = 'Don\'t have account?';
const String kCONTINUEWITHFACEBOOK = 'CONNECT WITH FACEBOOK';
const String kCONTINUEWITHGOOGLE = 'CONNECT WITH GOOGLE';
const String kSignUp = 'Sign Up';
const String kCreateAccount = 'Create Account';
const String kSignUpDescription =
    'Enter your Name, Email, Password for sign up.';
const String kName = 'Name';
const String kConfirmPassword = 'Confirm Password';
const String kSIGNUP = 'SIGN UP';
const String kAlreadyHaveAccount = 'Already have account?';
const String kAgreeToOurTerms =
    'By Signing up you agree to our Terms Conditions & Privacy Policy';
const String kForgotPasswordDescription =
    'Enter your email address and we will send you a reset instructions.';
const String kRESETPASSWORD = 'RESET PASSWORD';
const String kForgotPasswordNoQM = 'Forgot Password';
const String kPhoneNumberAppBarTitle = 'Login to Foodly';
const String kPhoneNumberTopTextsTitle = 'Get started with Foodly';
const String kPhoneNumberTopTextsDescription =
    'Enter your phone number to use foodly and enjoy your food :)';
const String kPhoneNumber = 'Phone Number';
const String kVerifyPhoneNumber = 'Verify phone number';
const String kVERIFYPHONENUMBER = 'VERIFY PHONE NUMBER';
const String kVerifyPhoneNumberTopTextsTitle =
    'Enter the 6-Digit code sent to you at';
const String kCONTINUE = 'CONTINUE';
const String kDidntReceiveCode = 'Didn\'t receive code?';
const String kResendAgain = 'Resend Again';
const String kChangePassword = 'Change Password';
const String kChangePasswordTopTextsDescription =
    'Enter new password for your account.';
const String kNewPassword = 'New Password';
const String kConfirmNewPassword = 'Confirm New Password';
const String kVerifyEmailAddress = 'Verify email address';
const String kVerifyEmailAddressTopTextsDescription =
    'Enter the 6-Digit code sent to you at';
const String kFilter = 'Filter';
const String kSanFrancisco = 'San Francisco';
const String kDeliveryTo = 'Delivery to';
const String kSeeAll = 'See all';

//errors
const String kNameIncorrectError = 'Name is incorrect!';
const String kNameEmptyError = 'Name can\'t be empty!';
const String kEmailIncorrectError = 'Email is incorrect!';
const String kEmailEmptyError = 'Email can\'t be empty!';
const String kPasswordIncorrectError = 'Password must be at least 8 character!';
const String kPasswordEmptyError = 'Password can\'t be empty!';
const String kConfirmPasswordIncorrectError =
    'Confirm password must be at least 8 character!';
const String kConfirmPasswordEmptyError = 'Confirm password can\'t be empty!';
const String kPhoneNumberIncorrectError = 'Phone number is incorrect!';
const String kPhoneNumberEmptyError = 'Phone number can\'t be empty!';
const String kPasswordMatchIncorrectError = 'Passwords doesn\'t match!';
const String kNewPasswordEmptyError = 'New password can\'t be empty!';
const String kNewPasswordIncorrectError =
    'New password must be at least 8 character!';
const String kConfirmNewPasswordEmptyError =
    'Confirm new password can\'t be empty!';
const String kConfirmNewPasswordIncorrectError =
    'Confirm new password must be at least 8 character!';
const String kAllRestaurants = 'All Restaurants';
const String kBestPacks = 'Best Packs';
const String kFeaturePartners = 'Feature Partners';

final referenceDatabase = FirebaseDatabase.instance.ref();
final firebaseAuth = FirebaseAuth.instance;
