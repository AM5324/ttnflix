import 'package:flutter/cupertino.dart';

class Validator {
  static bool isEmpty(String? value) {
    return value?.isEmpty ?? true;
  }

  static String? isEmailValid(BuildContext context, {String? email}) {
    var emailRegExp = RegExp("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}\\@" "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" "(" "\\." "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" ")+");
    if (isEmpty(email)) {
      return "Email Is Required";
    } else if (!emailRegExp.hasMatch(email ?? '')) {
      return  "Enter Valid Email";
    }
    return null;
  }

  static String? isValidPassword(BuildContext context, {String? password}) {
    if (isEmpty(password)) {
      return  "Password Is Required";
    } else if ((password?.trim().length ?? 0) < 8) {
      return "Password Is Short";
    }
    return null;
  }

  static String? isValidConfirmPassword(BuildContext context, {String? password, String? matchPassword}) {
    if (isEmpty(password)) {
      return  "Password Is Required";
    } else if ((password?.trim().length ?? 0) < 8) {
      return  "Password Is Short";
    } else if (password != matchPassword) {
      return "Password Mismatch";
    }
    return null;
  }

  static String? emptyValidate(BuildContext context, {String? value, String? message}){
    if(isEmpty(value ?? '')){
      return message;
    }
    return null;
  }
  static String? isValidName(BuildContext context, {String? name}) {
    var nameRegexp = RegExp(r"^[a-zA-Z ]+$");
    if (isEmpty(name)) {
      return  "Name Is Required";
    } else if (!nameRegexp.hasMatch(name ?? '')) {
      return "Enter Valid Name";
    }
    return null;
  }
}