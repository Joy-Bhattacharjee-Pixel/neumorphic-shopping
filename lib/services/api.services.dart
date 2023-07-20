import 'package:cloud_firestore/cloud_firestore.dart';

class APIService {
  // Create a CollectionReference called users that references the firestore collection
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');
}
