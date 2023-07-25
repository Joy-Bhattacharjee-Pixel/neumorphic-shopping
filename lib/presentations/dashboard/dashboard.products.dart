import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/models/product.model2.dart';

import '../../commons/common.widgets.dart';
import '../../controllers/product.controller.dart';
import '../../models/color.model.dart';

class DashboardProducts extends StatefulWidget {
  const DashboardProducts({super.key});

  @override
  State<DashboardProducts> createState() => _DashboardProductsState();
}

class _DashboardProductsState extends State<DashboardProducts> {
  // importing product controller
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    productController.fetchAllProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.allProductsLoading.value) {
        return SizedBox();
      } else {
        return Container(
            width: Get.width,
            color: Color(0xFFf7f7f7),
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(children: [
                  allCategoriesAvailable,
                  CommonWidgets.spacer(height: 15),
                  GridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.6,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: List.generate(
                          productController.availableProducts.length,
                          (index) => productTile(
                              productModel:
                                  productController.availableProducts[index])))
                ])));
      }
    });
  }

  // All categories available
  Widget get allCategoriesAvailable => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [allCategoriesText, seeMoreOption]);

  // See more option
  Widget get seeMoreOption =>
      Text("See more", style: TextStyle(fontSize: 12, color: AppColors.purple));

  // All categories text
  Widget get allCategoriesText => Text("Our best seller items",
      style: TextStyle(fontSize: 15, color: Colors.black));

  // product tile
  Widget productTile({required ProductModel2 productModel}) => Container(
      decoration: decoration,
      child: Column(children: [
        imageWidget(image: productModel.image),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            productModel.name ?? "",
            maxLines: 2,
            style: TextStyle(fontSize: 13),
          ),
        )
      ]));

  // image widget
  Widget imageWidget({image}) => Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6), topRight: Radius.circular(6)),
          child: Image(
            width: Get.width,
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      );

  Decoration get decoration => BoxDecoration(
      borderRadius: BorderRadius.circular(6), color: const Color(0xFFf0f0f0));
}
