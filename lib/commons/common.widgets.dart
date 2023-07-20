import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/models/color.model.dart';

class CommonWidgets {
  static Widget spacer({int height = 0, int width = 0}) =>
      SizedBox(height: height.toDouble(), width: width.toDouble());

  static Widget get circleLoader => Center(
      child:
          CircularProgressIndicator(color: AppColors.purple, strokeWidth: 2));

  static get closeKeyboard => FocusScope.of(Get.context!).unfocus();

}
