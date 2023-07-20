import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/models/color.model.dart';
import 'package:shopping_neumorphic/models/font.model.dart';
import 'package:shopping_neumorphic/presentations/authentication/mobile.number.dart';
import 'package:shopping_neumorphic/presentations/authentication/register.dart';
import 'package:shopping_neumorphic/presentations/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            primaryColor: AppColors.purple,
            fontFamily: Fonts.regular,
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true),
        home: SplashScreen());
  }
}
