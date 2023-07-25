import 'package:cloud_firestore/cloud_firestore.dart';
import 'api.services.dart';

class ProductServices {
  // fetching all categories
  static Future<List<QueryDocumentSnapshot<Object?>>> get allCategories async {
    try {
      // categoires collection reference
      final categoriesCollection = APIService.categories;

      // fetch the documents for this query
      final categoryDocs =
          await categoriesCollection.orderBy("id", descending: false).get();

      // finding out all the docs
      final allDocs = categoryDocs.docs;

      return allDocs;
    } catch (e) {
      return [];
    }
  }

  // fetching all products
  static Future<List<QueryDocumentSnapshot<Object?>>> get allProducts async {
    try {
      // categoires collection reference
      final productCollection = APIService.products;

      // fetch the documents for this query
      final productDocs = await productCollection.get();

      // finding out all the docs
      final allDocs = productDocs.docs;

      return allDocs;
    } catch (e) {
      return [];
    }
  }
}
