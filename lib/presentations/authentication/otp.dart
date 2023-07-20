import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shopping_neumorphic/commons/common.neumorphic.button.dart';
import 'package:shopping_neumorphic/commons/common.widgets.dart';
import 'package:shopping_neumorphic/controllers/auth.controller.dart';

import '../../models/color.model.dart';

class VerifyOTPScreen extends StatelessWidget {
  VerifyOTPScreen({super.key, required this.mobileNumber});

  final String mobileNumber;

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(children: [
        CommonWidgets.spacer(height: 20),
        loginTitle,
        loginSubTitle,
        CommonWidgets.spacer(height: 20),
        pinputField,
        CommonWidgets.spacer(height: 20),
        verifyOTPButton
      ]),
    ));
  }

  

  Widget get verifyOTPButton => Obx(() {
        if (authController.verifyingOTP.value) {
          return CommonWidgets.circleLoader;
        } else {
          return CommonNeumorphicButton(
              onPressed: () {
                authController.verifyOtp;
              },
              text: "Verify now");
        }
      });

  Widget get pinputField => Pinput(
        length: 6,
        controller: authController.otpController,
        submittedPinTheme: PinTheme(
            height: 57,
            width: 50,
            decoration: BoxDecoration(
                color: AppColors.inverse,
                borderRadius: BorderRadius.circular(7)),
            textStyle: TextStyle(fontSize: 18)),
      );

  Widget get loginSubTitle => Text(loginSubTitleString, style: loginSubStyle);

  TextStyle get loginSubStyle => TextStyle(
      fontSize: 15,
      color: AppColors.grey,
      height: 1.5,
      fontWeight: FontWeight.w400);

  String get loginSubTitleString =>
      "We have sent you an OTP to mobile number $mobileNumber";

  Widget get loginTitle => Text(loginTitleString, style: loginStyle);

  TextStyle get loginStyle => TextStyle(
      fontSize: 21, color: AppColors.purple, fontWeight: FontWeight.w500);

  String get loginTitleString => "Verify OTP";
}
