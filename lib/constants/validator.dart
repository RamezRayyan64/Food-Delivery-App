import 'package:email_validator/email_validator.dart';
import 'package:food_delivery/constants/lists.dart';
import 'package:food_delivery/constants/strings.dart';

bool emailValidator(String emailAddress) {
  if (emailAddress != '') {
    if (validatorList.contains(kEmailEmptyError)) {
      validatorList.remove(kEmailEmptyError);
    }
    if (EmailValidator.validate(emailAddress)) {
      if (validatorList.contains(kEmailIncorrectError)) {
        validatorList.remove(kEmailIncorrectError);
      }
      return false;
    } else {
      if (!validatorList.contains(kEmailIncorrectError)) {
        validatorList.add(kEmailIncorrectError);
      }
      return true;
    }
  } else {
    if (!validatorList.contains(kEmailEmptyError)) {
      validatorList.add(kEmailEmptyError);
    }
    return true;
  }
}

bool passwordValidator(
    String password, String emptyError, String incorrectError) {
  if (password != '') {
    if (validatorList.contains(emptyError)) {
      validatorList.remove(emptyError);
    }
    if (password.length >= 8) {
      if (validatorList.contains(incorrectError)) {
        validatorList.remove(incorrectError);
      }
      return false;
    } else {
      if (!validatorList.contains(incorrectError)) {
        validatorList.add(incorrectError);
      }
      return true;
    }
  } else {
    if (!validatorList.contains(emptyError)) {
      validatorList.add(emptyError);
    }
    return true;
  }
}

bool nameValidator(String name) {
  bool isNameContainDigit = false;
  List number = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  if (name != '') {
    if (validatorList.contains(kNameEmptyError)) {
      validatorList.remove(kNameEmptyError);
    }
    for (int i = 0; i < name.length; i++) {
      for (int j = 0; j < number.length; j++) {
        if (name[i].contains(number[j])) {
          isNameContainDigit = true;
          break;
        }
      }
    }
    if (isNameContainDigit) {
      if (!validatorList.contains(kNameIncorrectError)) {
        validatorList.add(kNameIncorrectError);
      }
      return true;
    } else {
      if (validatorList.contains(kNameIncorrectError)) {
        validatorList.remove(kNameIncorrectError);
      }
      return false;
    }
  } else {
    if (!validatorList.contains(kNameEmptyError)) {
      validatorList.add(kNameEmptyError);
    }
    return true;
  }
}

bool confirmPasswordValidator(String confirmPassword) {
  if (confirmPassword != '') {
    if (validatorList.contains(kConfirmPasswordEmptyError)) {
      validatorList.remove(kConfirmPasswordEmptyError);
    }
    if (confirmPassword.length >= 8) {
      if (validatorList.contains(kConfirmPasswordIncorrectError)) {
        validatorList.remove(kConfirmPasswordIncorrectError);
      }
      return false;
    } else {
      if (!validatorList.contains(kConfirmPasswordIncorrectError)) {
        validatorList.add(kConfirmPasswordIncorrectError);
      }
      return true;
    }
  } else {
    if (!validatorList.contains(kConfirmPasswordEmptyError)) {
      validatorList.add(kConfirmPasswordEmptyError);
    }
    return true;
  }
}

bool passwordsMatchValidator(String password, String confirmPassword) {
  if (password.contains(confirmPassword)) {
    if (validatorList.contains(kPasswordMatchIncorrectError)) {
      validatorList.remove(kPasswordMatchIncorrectError);
    }
    return false;
  } else {
    if (!validatorList.contains(kPasswordMatchIncorrectError)) {
      validatorList.add(kPasswordMatchIncorrectError);
    }
    return true;
  }
}

bool phoneNumberValidator(String phoneNumber) {
  if (phoneNumber != '') {
    if (validatorList.contains(kPhoneNumberEmptyError)) {
      validatorList.remove(kPhoneNumberEmptyError);
    }
    if (phoneNumber.length >= 10) {
      if (validatorList.contains(kPhoneNumberIncorrectError)) {
        validatorList.remove(kPhoneNumberIncorrectError);
      }
      return false;
    } else {
      if (!validatorList.contains(kPhoneNumberIncorrectError)) {
        validatorList.add(kPhoneNumberIncorrectError);
      }
      return true;
    }
  } else {
    if (!validatorList.contains(kPhoneNumberEmptyError)) {
      validatorList.add(kPhoneNumberEmptyError);
    }
    return true;
  }
}

bool codeDigitValidator(String codeDigit) {
  bool isCodeContainNumber = true;
  List number = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  if (codeDigit != '') {
    for (int i = 0; i < codeDigit.length; i++) {
      for (int j = 0; j < number.length; j++) {
        if (codeDigit[i].contains(number[j])) {
          isCodeContainNumber = false;
          break;
        }
      }
    }
    return isCodeContainNumber;
  } else {
    return isCodeContainNumber;
  }
}
