import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/models/category.model.dart';
import 'package:shopping_neumorphic/models/product.model2.dart';
import 'package:shopping_neumorphic/services/product.services.dart';
import '../services/api.services.dart';

class ProductController extends GetxController {
  // search text field controller
  TextEditingController searchTextFieldController = TextEditingController();

  // all categories available
  RxList<CategoryModel> availableCategories = <CategoryModel>[].obs;

  // all categories loading
  RxBool allCategoriesLoading = false.obs;

  // all Products available
  RxList<ProductModel2> availableProducts = <ProductModel2>[].obs;

  // all Products loading
  RxBool allProductsLoading = false.obs;

  // Fetching all caetgories available
  void get fetchAllCategories async {
    // all categories loading - true
    allCategoriesLoading(true);

    // categoires collection reference
    final categoriesCollection = APIService.categories;

    // clearing categories
    availableCategories.clear();

    try {
      // all category doc ids
      final allCategoryDocs = await ProductServices.allCategories;

      // looping through every docs
      allCategoryDocs.forEach((doc) async {
        // getting doc based on doc id
        final rawCategoryDocSnapshot =
            await categoriesCollection.doc(doc.id).get();

        // getting raw category
        final rawCategory =
            rawCategoryDocSnapshot.data() as Map<String, dynamic>;

        // parsing category
        final category = CategoryModel.fromJson(rawCategory);

        // adding each category in the list
        availableCategories.add(category);
      });

      // refreshing the category list
      availableCategories.refresh();
    } catch (e) {
      log(e.toString());
    }
    // all categories loading - false
    allCategoriesLoading(false);
  }

  // fetching all products available
  void get fetchAllProducts async {
    // all categories loading - true
    allProductsLoading(true);

    // categoires collection reference
    final productsCollection = APIService.products;

    // clearing categories
    availableProducts.clear();

    try {
      // all category doc ids
      final allProductDocs = await ProductServices.allProducts;

      // looping through every docs
      allProductDocs.forEach((doc) async {
        // getting doc based on doc id
        final rawProductDocSnapshot =
            await productsCollection.doc(doc.id).get();

        // getting raw products
        final rawProduct = rawProductDocSnapshot.data() as Map<String, dynamic>;

        // parsing products
        final products = ProductModel2.fromJson(rawProduct);

        // adding each products in the list
        availableProducts.add(products);
      });

      // refreshing the category list
      availableProducts.refresh();
    } catch (e) {
      log(e.toString());
    }
    // all categories loading - false
    allProductsLoading(false);
  }
}
