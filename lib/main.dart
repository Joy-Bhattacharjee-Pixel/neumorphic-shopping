import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/models/color.model.dart';
import 'package:shopping_neumorphic/models/font.model.dart';
import 'package:shopping_neumorphic/presentations/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Be Casual',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Fonts.regular,
        scaffoldBackgroundColor: ColorModel.neumorphicColor
      ),
      home: SplashScreen(),
    );
  }
}
