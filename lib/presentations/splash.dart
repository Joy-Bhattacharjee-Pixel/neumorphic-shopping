import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/controllers/splash.controller.dart';
import 'package:shopping_neumorphic/models/color.model.dart';
import 'package:shopping_neumorphic/models/font.model.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  // Initialize the splash controller
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: centeredWidget), pixelText],
      ),
    );
  }

  // Pixel consultancy text
  Widget get pixelText => Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          children: [
            // From text
            fromText,
            // Pixel image
            //  const Image(
            //       height: 100.0,
            //       image: AssetImage("assets/Logo Original Colour.png"))
            Text(
              "Pixel Consultancy",
              style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: Fonts.medium,
                  color: const Color(0xFF815BE3)),
            )
          ],
        ),
      );
  Widget get fromText => const Text(
        "from",
        style: TextStyle(fontSize: 15.0, color: Colors.black45),
      );
  // Centered neumorphic widget
  Widget get centeredWidget => Center(
        child: SizedBox(
          height: 300.0,
          width: 300.0,
          child: Neumorphic(
            style: mainStyle,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Neumorphic(
                style: mainStyle,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(45.0),
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Image(
                          height: 150.00,
                          width: 150.00,
                          image: AssetImage("assets/Logo.png")),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  // Main widget neumorphic style
  NeumorphicStyle get mainStyle => NeumorphicStyle(
      shadowLightColorEmboss: Colors.black.withOpacity(0.3),
      shadowDarkColorEmboss: Colors.black.withOpacity(0.25),
      intensity: 2,
      depth: -3,
      boxShape: commonBoxShape,
      color: ColorModel.neumorphicColor);
  // Common box shape
  NeumorphicBoxShape get commonBoxShape => const NeumorphicBoxShape.circle();
}
