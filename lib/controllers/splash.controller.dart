import 'dart:async';

import 'package:get/get.dart';
import 'package:shopping_neumorphic/models/nav.model.dart';
import 'package:shopping_neumorphic/presentations/authentication/auth.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () {
      Get.to(() => AuthenticationScreen());
    });
  }
}
