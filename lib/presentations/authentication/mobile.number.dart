import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/commons/common.neumorphic.button.dart';
import 'package:shopping_neumorphic/commons/common.widgets.dart';
import 'package:shopping_neumorphic/controllers/auth.controller.dart';

import '../../commons/common.textfield.dart';
import '../../models/color.model.dart';

class MobileNumberScreen extends StatelessWidget {
  MobileNumberScreen({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: authController.mobileNumberKey,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          CommonWidgets.spacer(height: 20),
          loginTitle,
          loginSubTitle,
          CommonWidgets.spacer(height: 20),
          mobileNumberField,
          CommonWidgets.spacer(height: 20),
          getOtpButton,
          CommonWidgets.spacer(height: 15),
          orOption,
          CommonWidgets.spacer(height: 15),
          Row(
            children: [
              Expanded(
                child: alternateLoginOption(
                    title: "Google",
                    icon:
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png"),
              ),
              CommonWidgets.spacer(width: 15),
              Expanded(
                child: alternateLoginOption(
                    title: "Facebook",
                    icon:
                        "https://cdn-icons-png.flaticon.com/512/5968/5968764.png"),
              ),
            ],
          ),
          CommonWidgets.spacer(height: 25),
          mobileNoSection,
          CommonWidgets.spacer(height: 15),
          signupSection
        ]),
      ),
    ));
  }

  Widget get mobileNoSection => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [loginMobile, mobileNo]);

  Widget get loginMobile => Text(loginusingMobile, style: loginMobileStyle);

  Widget get mobileNo => Text(mobileNoString, style: mobileNoStyle);

  TextStyle get mobileNoStyle => TextStyle(
      fontSize: 12.8, color: AppColors.purple, fontWeight: FontWeight.w500);

  TextStyle get loginMobileStyle =>
      TextStyle(fontSize: 13, color: AppColors.grey);

  String get loginusingMobile => "Instead of mobile login using ";

  String get mobileNoString => "Email & Password";

  Widget get signupSection => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [dontHaveAccnt, registerOption]);

  Widget get dontHaveAccnt =>
      Text(dontHaveAccntString, style: dontHaveAccntStyle);

  Widget get registerOption => Text(registerString, style: registerStyle);

  TextStyle get registerStyle => TextStyle(
      fontSize: 12.8, color: AppColors.purple, fontWeight: FontWeight.w500);

  TextStyle get dontHaveAccntStyle =>
      TextStyle(fontSize: 13, color: AppColors.grey);

  String get dontHaveAccntString => "Don't have an account? ";

  String get registerString => "Register now";

  Widget alternateLoginOption({title, icon}) => Container(
      height: containerHeight,
      width: containerWidth,
      decoration: decoration,
      child: loginChild(title: title, icon: icon));

  Widget loginChild({title, icon}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (icon != null) loginIconChild(icon: icon),
          CommonWidgets.spacer(width: 8),
          loginTitleChild(title: title)
        ]),
      );

  Widget loginIconChild({icon}) => Image(
      height: imageHeights, image: loginIconChildImageProvider(icon: icon));

  double imageHeights = 22;

  ImageProvider loginIconChildImageProvider({icon}) => NetworkImage(icon);

  Widget loginTitleChild({title}) => Text(title);

  double containerHeight = 47, containerWidth = Get.width;

  BoxDecoration get decoration => BoxDecoration(
      borderRadius: borderRadius,
      color: Colors.black.withOpacity(0.03),
      border: border);

  Border get border => Border.all(color: Colors.black12);

  BorderRadius get borderRadius => BorderRadius.circular(6);

  Widget get facebookIcon => Image(
      height: 25,
      image: NetworkImage(
          "https://cdn-icons-png.flaticon.com/512/5968/5968764.png"));

  Widget get googleIcon => Image(
      height: 25,
      image: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png"));

  Widget get orOption => Row(
        children: [
          Expanded(child: Divider(color: Colors.black.withOpacity(0.05))),
          CommonWidgets.spacer(width: 8),
          Text("or login with", style: orStyle),
          CommonWidgets.spacer(width: 8),
          Expanded(child: Divider(color: Colors.black.withOpacity(0.05)))
        ],
      );

  TextStyle get orStyle => TextStyle(
      fontSize: 12, color: AppColors.grey, fontWeight: FontWeight.w400);

  Widget get getOtpButton => Obx(() {
        if (authController.gettingOTP.value) {
          return CommonWidgets.circleLoader;
        } else {
          return CommonNeumorphicButton(
              onPressed: () {
                authController.getOTP;
              },
              text: "Verify mobile number");
        }
      });

  Widget get mobileNumberField => CommonTextField(
      textInputType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (mobileNumber) {
        if (mobileNumber!.isEmpty) {
          return "Mobile number is required";
        } else if (mobileNumber.length < 10) {
          return "This mobile number is not valid";
        }
        return null;
      },
      controller: authController.mobileController,
      hint: "Mobile number");

  Widget get loginSubTitle => Text(loginSubTitleString, style: loginSubStyle);

  TextStyle get loginSubStyle => TextStyle(
      fontSize: 15,
      color: AppColors.grey,
      height: 1.5,
      fontWeight: FontWeight.w400);

  String get loginSubTitleString =>
      "Provide your mobile number and verify OTP for faster login";

  Widget get loginTitle => Text(loginTitleString, style: loginStyle);

  TextStyle get loginStyle => TextStyle(
      fontSize: 21, color: AppColors.purple, fontWeight: FontWeight.w500);

  String get loginTitleString => "Login using mobile number";
}
