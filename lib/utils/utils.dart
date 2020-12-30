import 'dart:io';

import 'package:flutter/material.dart';

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
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        return true;
      }
      return false;
    } on SocketException catch (_) {
      debugPrint('not connected');
      return false;
    }
  }
}
