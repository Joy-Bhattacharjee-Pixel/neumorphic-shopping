import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/models/font.model.dart';
import '../models/color.model.dart';

class CommonNeumorphicButton extends StatelessWidget {
  CommonNeumorphicButton(
      {super.key, required this.onPressed, required this.text});

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 47,
      child: NeumorphicButton(
        style: neumorphicStyle,
        onPressed: () {
          onPressed();
        },
        child: buttonChild,
      ),
    );
  }

  NeumorphicStyle get neumorphicStyle => NeumorphicStyle(
      color: buttonColor,
      shape: neumorphicShape,
      border: neumorphicBorder,
      depth: 1,
      intensity: 1,
      boxShape: neumorphicBoxShape);

  NeumorphicBorder get neumorphicBorder =>
      NeumorphicBorder(color: neumorphicBorderColor);

  Color get neumorphicBorderColor => Colors.black12;

  NeumorphicBoxShape get neumorphicBoxShape =>
      NeumorphicBoxShape.roundRect(BorderRadius.circular(6));

  NeumorphicShape get neumorphicShape => NeumorphicShape.flat;

  Color get buttonColor => AppColors.neumorphicColor;

  Size get buttonSize => Size(buttonWidth, buttonHeight);

  double buttonHeight = 45, buttonWidth = Get.width;

  Widget get buttonChild => Center(child: Text(text, style: buttonTextStyle));

  TextStyle get buttonTextStyle => TextStyle(
      fontSize: 15, color: AppColors.purple, fontWeight: FontWeight.w500);
}
