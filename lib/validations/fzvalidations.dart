import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';

class FzValidation {
  /// Phone Validation
  static String? phoneValidator(String? phone) {
    String? error = 'Phone No. is not valid';
    if (phone!.isEmpty) {
      error = 'Phone No. can\'t be empty';
    } else {
      if (phone.length < 10 || phone.length > 10) {
        error = 'Phone No. not valid';
      } else {
        error = null;
      }
    }

    return error;
  }

  /// First Name Validation
  static String? firstNameValidator(String? name) {
    String? error = 'First Name can\'t contain numbers or whitespaces';
    if (name!.isEmpty)
      error = 'First Name can\'t be empty';
    else {
      //   if (Fzregex.hasMatch(name, FzPattern.al)) {
      error = null;
      //   }
    }

    return error;
  }

  /// Last Name Validation
  static String? lastNameValidator(String? name) {
    String? error = 'Last Name can\'t contain numbers or whitespaces';
    if (name!.isEmpty)
      error = 'Last Name can\'t be empty';
    else {
      //   if (Fzregex.hasMatch(name, FzPattern.al)) {
      error = null;
      //   }
    }

    return error;
  }

  /// Email Validation
  static String? emailValidator(String? value) {
    String? error = 'Email is not valid';

    if (value!.isEmpty)
      // Email Form Field is Empty
      error = "Email can\'t be empty";

    if (Fzregex.hasMatch(value, FzPattern.email))
      // Email is valid
      error = null;

    // The pattern of the email didn't match the regex in Fzregex.
    return error;
  }

  /// Password Validation
  static String? passwordValidator(String? password) {
    String? error =
        'Password must contain at least: 1 uppercase letter, 1 lowecase letter, 1 number & 1 special character';
    if (password!.isEmpty)
      error = 'Password can\'t be empty';
    else {
      // if (Fzregex.hasMatch(password, FzPattern.passwordHard)) {
      error = null;
      // }
    }

    return error;
  }

  /// Confirm Password Validation
  static String? confirmPasswordValidator(String? cpassword, String? password) {
    String? error = 'Confirm Password doesn\'t match the above password.';
    if (cpassword!.isEmpty)
      error = 'Confirm Password can\'t be empty';
    else {
      if (cpassword == password) {
        error = null;
      }
    }

    return error;
  }

  /// Username Validation
  static String? usernameValidator(String? username) {
    String? error = 'Username/Email can\'t be empty';
    if (username!.isEmpty)
      error = 'Username/Email can\'t be empty';
    else {
      error = null;
    }

    return error;
  }
}
