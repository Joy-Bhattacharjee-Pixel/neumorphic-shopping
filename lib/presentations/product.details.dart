import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/models/font.model.dart';
import 'package:shopping_neumorphic/models/product.model.dart';

import '../models/color.model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel productModel;
  ProductDetails({super.key, required this.productModel});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int itemAdded = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 60.0),
        child: appBar,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child:
                      Image(image: AssetImage(widget.productModel.image ?? "")),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 15),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: NeumorphicRadio(
                      onChanged: (value) {},
                      style: NeumorphicRadioStyle(
                          selectedColor: AppColors.neumorphicColor,
                          selectedDepth: -10.0,
                          unselectedDepth: 5.0,
                          intensity: 2.0,
                          shape: NeumorphicShape.concave,
                          unselectedColor: AppColors.neumorphicColor),
                      // value: 1,
                      // groupValue: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.purple,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: SizedBox(
                      height: 10.0,
                      width: 30.0,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            depth: 1.0,
                            color: AppColors.purple,
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(5.0))),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: SizedBox(
                      height: 10.0,
                      width: 10.0,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            depth: 1.0,
                            color: AppColors.neumorphicColor,
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(5.0))),
                      ),
                    ),
                  );
                }
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "French Terry Drawstring Hoodie",
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.productModel.price ?? "",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  "inclusive of all taxes",
                  style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF717174),
                      fontFamily: Fonts.regular),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  "Select Size",
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
          allAvaialableOptions,
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 15.0, right: 15.0, bottom: 15.0),
            child: SizedBox(
              width: Get.width,
              height: 45.0,
              child: NeumorphicButton(
                onPressed: () {
                  itemAdded += 1;
                  setState(() {});
                  Get.snackbar("title", "",
                      backgroundColor: AppColors.purple.withOpacity(0.1),
                      messageText: const SizedBox(),
                      titleText: Center(
                          child: Text(
                        "Item added in the cart",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            ),
                      )));
                },
                style: NeumorphicStyle(
                    color: AppColors.neumorphicColor,
                    depth: 3,
                    intensity: 5.0,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(8.0)),
                    shape: NeumorphicShape.concave),
                child: Center(
                    child: Text(
                  itemAdded == 0 ? "Add to cart" : "Go to cart",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  int selectedSize = 2;

  // Available options to tap
  Widget get allAvaialableOptions => Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              availableSizes.length,
              (index) =>
                  rowOptionsTile(text: availableSizes[index], index: index)),
        ),
      );

  Widget rowOptionsTile({String? text, int? index}) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: NeumorphicRadio(
              onChanged: (value) {
                // homeController.changeIndex(value ?? 0);
                selectedSize = value ?? 0;
                setState(() {});
              },
              style: NeumorphicRadioStyle(
                  selectedDepth: 5.0,
                  intensity: 5.0,
                  shape: NeumorphicShape.concave,
                  selectedColor: AppColors.neumorphicColor,
                  unselectedColor: AppColors.neumorphicColor),
              value: index,
              groupValue: selectedSize,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                      child: Text(
                    text ?? "",
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.black),
                  )))),
        ),
      );

  List availableSizes = ["S", "M", "L", "XL", "XXL"];

  // Appbar
  Widget get appBar => AppBar(
        leading: leadingIcon,
        leadingWidth: 60.0,
        centerTitle: true,
        title: Text(
          "Products",
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, ),
        ),
        backgroundColor: AppColors.neumorphicColor,
        elevation: 0.0,
        actions: [actionFilterIcon],
      );

  // Action button - filter icon
  Widget get actionFilterIcon => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: NeumorphicButton(
          margin: const EdgeInsets.all(0.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          onPressed: () {},
          style: NeumorphicStyle(
              color:
                  itemAdded == 0 ? AppColors.neumorphicColor : AppColors.purple,
              depth: 3.5,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(5.0)),
              shape: NeumorphicShape.concave),
          child: Column(
            children: [
              if (itemAdded != 0)
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, top: 4.0),
                  child: Text(
                    itemAdded.toString(),
                    style: TextStyle(
                        fontSize: 10.0,
                        height: 0.5,
                        
                        color: itemAdded == 0 ? Colors.black : Colors.white),
                  ),
                ),
              Expanded(
                child: Icon(Feather.shopping_cart,
                    color: itemAdded == 0 ? Colors.black : Colors.white,
                    size: 18.0),
              ),
            ],
          ),
        ),
      );

  // Leading icon - back icon
  Widget get leadingIcon => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: NeumorphicButton(
          margin: const EdgeInsets.all(0.0),
          padding: const EdgeInsets.all(8.0),
          onPressed: () {
            Get.back();
          },
          style: leadingStyle,
          child:
              const Icon(Feather.arrow_left, color: Colors.black87, size: 22.0),
        ),
      );

  // Leading icon style
  NeumorphicStyle get leadingStyle => NeumorphicStyle(
      color: AppColors.neumorphicColor,
      depth: 3.5,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5.0)),
      shape: NeumorphicShape.concave);
}
