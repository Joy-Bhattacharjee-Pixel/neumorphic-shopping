import 'dart:async';
import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/commons/common.vars.dart';
import 'package:shopping_neumorphic/models/color.model.dart';
import 'package:shopping_neumorphic/models/customer.model.dart';
import 'package:shopping_neumorphic/models/navigate.model.dart';
import 'package:shopping_neumorphic/presentations/authentication/auth.dart';
import 'package:shopping_neumorphic/presentations/dashboard/dashboard.dart';
import 'package:shopping_neumorphic/services/cookie_services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkRoute;
    });
  }

  // Checking route based on saved credentials
  void get checkRoute async {
    // Checking available doc id
    final docId = await getCookie(key: "docId");
    // Checking available customer details
    final customer = await getCookie(key: "customer");

    if (docId != null && customer != null) {
      // Parsing customer string to json
      final customerJson = jsonDecode(customer);

      // Saving customer object in value notifier
      CommonVars.customer.value = Customer.fromJson(customerJson);

      // Saving doc id in the value notifier
      CommonVars.docId.value = docId;

      // When doc id is not null - Navigating to the dashboard
      AppNavigator.navigate(screen: AppNavigator.dashboard);
    } else {
      // When doc id is null - Navigating to the login screen
      AppNavigator.navigate(screen: AppNavigator.login);
    }
  }

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
              style: TextStyle(fontSize: 22.0, color: const Color(0xFF815BE3)),
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
      color: AppColors.neumorphicColor);

  // Common box shape
  NeumorphicBoxShape get commonBoxShape => const NeumorphicBoxShape.circle();
}
