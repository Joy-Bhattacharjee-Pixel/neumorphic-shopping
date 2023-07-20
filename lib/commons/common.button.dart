import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/models/color.model.dart';

class CommonButton extends StatelessWidget {
  CommonButton({super.key, required this.onPressed, required this.text});

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: buttonChild,
        style: buttonStyle);
  }

  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
      fixedSize: buttonSize, backgroundColor: buttonColor);

  Color get buttonColor => AppColors.purple;

  Size get buttonSize => Size(buttonWidth, buttonHeight);

  double buttonHeight = 45, buttonWidth = Get.width;

  Widget get buttonChild => Text(text, style: buttonTextStyle);

  TextStyle get buttonTextStyle => TextStyle(fontSize: 14, color: Colors.white);
}
