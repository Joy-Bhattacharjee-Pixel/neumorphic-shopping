import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/commons/common.button.dart';
import 'package:shopping_neumorphic/commons/common.neumorphic.button.dart';
import 'package:shopping_neumorphic/commons/common.widgets.dart';
import 'package:shopping_neumorphic/controllers/auth.controller.dart';
import '../../commons/common.textfield.dart';
import '../../models/color.model.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: authController.registerKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(children: [
            CommonWidgets.spacer(height: 20),
            resgiterTitle,
            registerSubTitle,
            CommonWidgets.spacer(height: 20),
            nameField,
            CommonWidgets.spacer(height: 10),
            emailField,
            CommonWidgets.spacer(height: 10),
            phoneField,
            CommonWidgets.spacer(height: 10),
            passwordField,
            CommonWidgets.spacer(height: 10),
            confirmPasswordField,
            CommonWidgets.spacer(height: 15),
            registerButton,
            CommonWidgets.spacer(height: 25),
            signupSection
          ]),
        ),
      ),
    );
  }

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

  String get dontHaveAccntString => "Already have an account? ";

  String get registerString => "Sign in now";

  Widget get registerButton => Obx(() {
        if (authController.registerLoading.value) {
          return CommonWidgets.circleLoader;
        } else {
          return CommonNeumorphicButton(
              onPressed: () {
                authController.register;
              },
              text: "Register now");
        }
      });

  Widget get phoneField => CommonTextField(
      textInputType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (name) {
        return authController.namevalidator(
            title: name ?? "", errorMessage: "Phone number is required");
      },
      controller: authController.phoneRegController,
      hint: "Phone number");

  Widget get nameField => CommonTextField(
      validator: (name) {
        return authController.namevalidator(
            title: name ?? "", errorMessage: "Full name is required");
      },
      controller: authController.nameController,
      hint: "Full name");

  Widget get confirmPasswordField => CommonTextField(
      validator: (confirmPassword) {
        if (confirmPassword!.isEmpty) {
          return "Confirm password is required";
        } else if (confirmPassword !=
            authController.passwordRegController.text) {
          return "Both passwords are not matching";
        }
        return null;
      },
      controller: authController.confirmPasswordRegController,
      hint: "Confirm password");

  Widget get passwordField => CommonTextField(
      validator: (password) {
        return authController.namevalidator(
            title: password ?? "", errorMessage: "Password is required");
      },
      controller: authController.passwordRegController,
      hint: "Password");

  Widget get emailField => CommonTextField(
      validator: (email) {
        return authController.emailvalidator(email: email ?? "");
      },
      controller: authController.emailRegController,
      hint: "Email address");

  Widget get registerSubTitle =>
      Text(registerSubTitleString, style: registerSubStyle);

  TextStyle get registerSubStyle => TextStyle(
      fontSize: 15,
      color: AppColors.grey,
      height: 1.5,
      fontWeight: FontWeight.w400);

  String get registerSubTitleString =>
      "Welcome in Be Casual mobile application, please fill out all the details";

  Widget get resgiterTitle => Text(resgiterTitleString, style: resgiterStyle);

  TextStyle get resgiterStyle => TextStyle(
      fontSize: 21, color: AppColors.purple, fontWeight: FontWeight.w500);

  String get resgiterTitleString => "Register yourself";
}
