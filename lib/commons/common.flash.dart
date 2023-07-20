import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/font.model.dart';

class FlashMessage {
  static show(
          {required String title,
          bool isSuccess = false,
          bool isError = false,
          String? message}) =>
      Get.snackbar(title, message ?? "",
          isDismissible: true,
          // Showing customised title text
          titleText: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14.0,
                fontFamily: Fonts.regular,
                color: isSuccess
                    ? Colors.green
                    : isError
                        ? Colors.red
                        : Colors.black),
          ),
          // Showing customised message text
          messageText: message == null
              ? SizedBox()
              : Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: Fonts.regular,
                      color: Colors.black),
                ));
}
