import 'package:cloud_firestore/cloud_firestore.dart';

class APIService {
  // Create a CollectionReference called users that references the firestore collection
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  // Create a CollectionReference called categories that references the firestore collection
  static CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');

  // Create a CollectionReference called categories that references the firestore collection
  static CollectionReference products =
      FirebaseFirestore.instance.collection('recomended_products');
}
