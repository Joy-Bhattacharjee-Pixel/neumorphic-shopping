import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/commons/common.widgets.dart';
import 'package:shopping_neumorphic/controllers/product.controller.dart';
import 'package:shopping_neumorphic/models/category.model.dart';
import 'package:shopping_neumorphic/models/color.model.dart';

class DashboardCategories extends StatefulWidget {
  DashboardCategories({super.key});

  @override
  State<DashboardCategories> createState() => _DashboardCategoriesState();
}

class _DashboardCategoriesState extends State<DashboardCategories> {
  // importing product controller
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    productController.fetchAllCategories;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.allCategoriesLoading.value) {
        return SizedBox(
            height: 300, width: Get.width, child: CommonWidgets.circleLoader);
      } else {
        return Container(
            width: Get.width,
            color: Color(0xFFf7f7f7),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                allCategoriesAvailable,
                CommonWidgets.spacer(height: 15),
                categories
              ]),
            ));
      }
    });
  }

  // All categories avaialble list
  Widget get categories => GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(
          productController.availableCategories.length,
          (index) => categoryTile(
              categoryModel: productController.availableCategories[index])));

  // Categories tile
  Widget categoryTile({required CategoryModel categoryModel}) => InkWell(
      onTap: () {},
      child: Container(
          decoration: decoration,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CommonWidgets.spacer(height: 5),
            imageWidget(image: categoryModel.image),
            CommonWidgets.spacer(height: 5),
            titleWidget(title: categoryModel.name),
            CommonWidgets.spacer(height: 5),
          ])));

  Widget titleWidget({title}) => Text(title, style: TextStyle(fontSize: 13));

  Widget imageWidget({image}) =>
      Expanded(child: Image(image: AssetImage(image)));

  Decoration get decoration => BoxDecoration(
      borderRadius: BorderRadius.circular(6), color: const Color(0xFFf0f0f0));

  // All categories available
  Widget get allCategoriesAvailable => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [allCategoriesText, seeMoreOption]);

  // See more option
  Widget get seeMoreOption =>
      Text("See more", style: TextStyle(fontSize: 12, color: AppColors.purple));

  // All categories text
  Widget get allCategoriesText => Text("Shop by category",
      style: TextStyle(fontSize: 15, color: Colors.black));
}
