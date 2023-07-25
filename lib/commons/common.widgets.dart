import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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

class CommonCartSection extends StatelessWidget {
  const CommonCartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Image(height: 30, image: AssetImage("assets/basket.png")),
        Positioned(
          bottom: 22,
          child: CircleAvatar(
            radius: 9,
            backgroundColor: AppColors.purple,
            child: Text(
              "2",
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ));
  }

  Widget get cartIcon => Icon(cartIconData);

  IconData get cartIconData => Feather.shopping_bag;
}
