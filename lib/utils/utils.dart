import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/res/strings.dart';

class Utils {
  Utils._();

  static void snakbar({BuildContext context}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
              "There is no internet connection! Please connect to the internet."),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(label: 'OK', onPressed: () {}),
        ),
      );

  static Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 4));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        return true;
      }
      return false;
    } on SocketException catch (_) {
      debugPrint('SocketException: not connected');
      return false;
    } on TimeoutException catch (_) {
      debugPrint('TimeoutException: not connected');
      return false;
    }
  }

  static String nameValidator(String value, String firebaseError) {
    if (value.isEmpty) {
      return Strings.nameRequiredError;
    } else if (value.length < 2) {
      return Strings.nameShortError;
    } else if (value.length > 30) {
      return Strings.nameLongError;
    }
    return null;
  }

  static String emailValidator(String value, String firebaseError) {
    final bool validateEmail = RegExp(Strings.regExp).hasMatch(value);

    if (value.isEmpty) {
      return Strings.emailRequiredError;
    } else if (!validateEmail) {
      return Strings.emailValidationError;
    } else if (firebaseError == Strings.firebaseEmailNotFoundError) {
      return Strings.emailNotFoundError;
    } else if (firebaseError == Strings.emailAlreadyInUsedError) {
      return Strings.emailAlreadyInUsedError;
    }
    return null;
  }

  static String passwordValidator(String value, String firebaseError) {
    if (value.trim().isEmpty) {
      return Strings.passwordRequiredError;
    } else if (value.length < 6) {
      return Strings.passwordShortError;
    } else if (firebaseError == Strings.passwordInvalidError) {
      return Strings.passwordInvalidError;
    }
    return null;
  }
}
