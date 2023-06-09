import 'package:get/get.dart';
import 'package:shopping_neumorphic/presentations/product.list.dart';

class Navigator {
  static String get productList => "/products";

  static Future<void> navigate(String screen) async {
    switch (screen) {
      case "/products":
       await Get.to(() => ProductList(),
            transition: Transition.fadeIn, duration: const Duration(seconds: 2));
        break;
      default:
    }
  }
}
