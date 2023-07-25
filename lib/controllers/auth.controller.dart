import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/commons/common.flash.dart';
import 'package:shopping_neumorphic/commons/common.vars.dart';
import 'package:shopping_neumorphic/commons/common.widgets.dart';
import 'package:shopping_neumorphic/models/customer.model.dart';
import 'package:shopping_neumorphic/presentations/authentication/otp.dart';
import 'package:shopping_neumorphic/presentations/dashboard/dashboard.dart';
import 'package:shopping_neumorphic/services/auth.services.dart';

import '../services/cookie_services.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController(),
      emailRegController = TextEditingController(),
      passwordRegController = TextEditingController(),
      confirmPasswordRegController = TextEditingController(),
      phoneRegController = TextEditingController();

  final TextEditingController mobileController = TextEditingController(),
      otpController = TextEditingController();

  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();
  final mobileNumberKey = GlobalKey<FormState>();

  String? namevalidator({required String title, required String errorMessage}) {
    if (title.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  String? emailvalidator({required String email}) {
    if (email.isEmpty) {
      return "Email is required";
    } else if (!email.isEmail) {
      return "This is not a valid email address";
    }
    return null;
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  RxString localVerificationId = "".obs;

  RxBool gettingOTP = false.obs;

  void get getOTP async {
    CommonWidgets.closeKeyboard;

    if (mobileNumberKey.currentState!.validate()) {
      gettingOTP(true);

      try {
        firebaseAuth.verifyPhoneNumber(
          phoneNumber: "+91${mobileController.text.trim()}",
          verificationCompleted: (phoneAuthCredential) {},
          verificationFailed: (error) {
            log(error.code.toString());
            FlashMessage.show(
                title: error.code.toString(),
                isError: true,
                message: "Please try later");
            gettingOTP(false);
          },
          codeSent: (verificationId, forceResendingToken) {
            localVerificationId.value = verificationId;
            Get.to(() => VerifyOTPScreen(mobileNumber: "+918697604919"));
            gettingOTP(false);
          },
          codeAutoRetrievalTimeout: (verificationId) {},
        );

        // gettingOTP(false);
      } catch (e) {
        FlashMessage.show(
            title: e.toString(), message: "Please try again", isError: true);
      }
    }
  }

  // Initializing firebase auth
  FirebaseAuth auth = FirebaseAuth.instance;

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Verifying otp
  RxBool verifyingOTP = false.obs;

  void get verifyOtp async {
    // Verifying otp button loading
    verifyingOTP(true);

    log(localVerificationId.value.toString());
    log(otpController.text.trim());

    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: localVerificationId.value,
          smsCode: otpController.text.trim());

      // Sign the user in (or link) with the credential
      final userCredentials = await auth.signInWithCredential(credential);

      // Checking user credentials is null or not
      final user = userCredentials.user;

      if (user != null) {
        // When user details is not null
        // Logged in user name
        final name = "Joy Bhattacherjee";
        // Logged in user email
        final email = "joy.bhattacharjee@pixelconsultancy.in";
        // Logged in user phone
        final phoneNo = "+918697604919";

        // Saving name + email + phone

        // User data
        final userData = {"name": name, "email": email, "phone": phoneNo};

        // Saving user details in firestore database
        try {
          await users.add(userData);
          FlashMessage.show(
              title: "User added successfully",
              message: "Proceeding to dashboard");
        } catch (e) {
          // When some error occurs
          log(e.toString());
        }
      }
    } catch (e) {
      FlashMessage.show(
          title: e.toString(), message: "Please try again", isError: true);
      // When some issue occurs
      log(e.toString());
    }

    // Verifying otp button loading
    verifyingOTP(false);
  }

  // Login button loading
  RxBool loginButtonLoading = false.obs;

  // Performing login operation using email & password
  Future<void> get login async {
    // Closing keyboard
    CommonWidgets.closeKeyboard;

    if (loginKey.currentState!.validate()) {
      // Login button loading started
      loginButtonLoading(true);

      // Login credential object
      Map<String, dynamic> credential = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim()
      };

      try {
        // Trying to login using email and password
        final docId = await AuthServices.login(credential: credential);

        if (docId == null) {
          // Some error occurs
        } else {
          // Find customer based on the doc id
          final customer = await users.doc(docId).get();
          final customerData = customer.data() as Map<String, dynamic>;

          // Customer name
          final customerName = customerData["name"];

          // Parsing customer json
          final customerJsonString = jsonEncode(customerData);

          // Saving customer data
          saveCookie(key: "customer", value: customerJsonString);

          // Saving customer doc id
          saveCookie(key: "docId", value: docId);

          // Showing logged in successful message
          FlashMessage.show(
              title: "Welcome back, ${customerName}",
              message: "Logged in successfully",
              isSuccess: true);

          // Navigating to dashboard
          Get.to(() => Dashboard());
        }
      } catch (e) {}
      // logged in successfully
      loginButtonLoading(false);
    }
  }

  // Register button loading
  RxBool registerLoading = false.obs;

  Future<void> get register async {
    // Register button start loading
    registerLoading(true);

    if (registerKey.currentState!.validate()) {
      // Register customer name
      final name = nameController.text.trim();
      // Register customer email
      final email = emailRegController.text.trim();
      // Register customer password
      final password = passwordRegController.text.trim();
      // Register customer phone number
      final phone = phoneRegController.text.trim();

      // Customer object
      final customer = {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone
      };

      try {
        // Registering customer in the database
        DocumentReference? documentReference =
            await AuthServices.register(customer: customer);

        if (documentReference != null) {
          // Document Id
          String docId = documentReference.id;

          // Saving document id
          saveCookie(key: "docId", value: docId);

          // Saving customer name, email, phone
          saveCookie(key: "name", value: customer["name"]);
          saveCookie(key: "email", value: customer["email"]);
          saveCookie(key: "phone", value: customer["phone"]);

          // Saving data in local value notifier
          CommonVars.docId.value = docId;
          CommonVars.customer.value = Customer(
              name: customer["name"],
              email: customer["email"],
              phone: customer["phone"]);

          // Redirecting to dashboard
          Get.to(() => Dashboard());
        } else {
          // When some issue happens
        }
      } catch (e) {
        // When some error occurs
        FlashMessage.show(
            title: e.toString(), message: "Please try again", isError: true);
      }

      // Register button stops loading
      registerLoading(false);
    }
  }
}
