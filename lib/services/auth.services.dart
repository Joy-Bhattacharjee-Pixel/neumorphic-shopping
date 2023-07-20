import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_neumorphic/commons/common.flash.dart';
import 'package:shopping_neumorphic/services/api.services.dart';

class AuthServices {
  // Registering new user
  static Future<DocumentReference?> register(
      {required Map<String, dynamic> customer}) async {
    try {
      // User collection reference
      final userCollection = APIService.users;

      // Adding new user in the user collection
      return await userCollection.add(customer);
    } catch (e) {
      return null;
    }
  }

  // Login existing user
  static Future<String?> login(
      {required Map<String, dynamic> credential}) async {
    try {
      // User collection reference
      final userCollection = APIService.users;

      // Getting user in the user collection based on email & password
      Query emailPasswordQuery = await userCollection
          .where("email", isEqualTo: credential["email"])
          .where("password", isEqualTo: credential["password"]);

      // Customers found with this email & password
      QuerySnapshot querySnapshot = await emailPasswordQuery.get();

      if (querySnapshot.docs.isEmpty) {
        // No users found with this email address & password
        FlashMessage.show(
            title: "Credentials are not matching",
            message: "Please try again",
            isError: true);
        log("No users found");
        return null;
      } else {
        // Users found with this email and password
        List<QueryDocumentSnapshot> matchedDocs = querySnapshot.docs;

        // Matched first user
        QueryDocumentSnapshot firstDoc = matchedDocs.first;

        return firstDoc.id;
      }
    } catch (e) {
      return null;
    }
  }
}
