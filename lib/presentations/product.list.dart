import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:shopping_neumorphic/models/color.model.dart';
import 'package:shopping_neumorphic/models/font.model.dart';
import 'package:shopping_neumorphic/models/product.model.dart';
import 'package:shopping_neumorphic/presentations/product.details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<int> selectedFavs = [0, 1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 60.0),
        child: appBar,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GridView.count(
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.9,
          children: List.generate(
              products.length,
              (index) => InkWell(
                  onTap: () async {
                    await Get.to(
                        () => ProductDetails(
                              productModel: products[index],
                            ),
                        transition: Transition.fadeIn,
                        duration: const Duration(seconds: 1));
                  },
                  child: productTile(
                      productModel: products[index], index: index))),
        ),
      ),
    );
  }

  // Product tile
  Widget productTile({required ProductModel productModel, int? index}) =>
      Neumorphic(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        style: productTileStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                  child: productImage(image: productModel.image, index: index)),
            )),
            // Product description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name ?? "",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontFamily: Fonts.medium),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productModel.price ?? "",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: Fonts.bold),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 2.0, right: 2.0),
                              child: Icon(
                                Feather.star,
                                size: 12.0,
                                color: ColorModel.purple,
                              ),
                            ),
                            Text(
                              productModel.rating!,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: ColorModel.purple,
                                  fontFamily: Fonts.medium),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );

  // Product image
  Widget productImage({String? image, int? index}) => Stack(
        children: [
          Center(child: Image(image: AssetImage(image ?? ""))),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: NeumorphicRadio(
                onChanged: (value) {
                  if (!selectedFavs.contains(index)) {
                    selectedFavs.add(index ?? 0);
                  } else {
                    selectedFavs.remove(index);
                  }
                  setState(() {});
                },
                style: NeumorphicRadioStyle(
                    selectedColor: ColorModel.neumorphicColor,
                    selectedDepth: -10.0,
                    unselectedDepth: 5.0,
                    intensity: 2.0,
                    shape: selectedFavs.contains(index)
                        ? NeumorphicShape.concave
                        : NeumorphicShape.convex,
                    unselectedColor: ColorModel.neumorphicColor),
                // value: 1,
                // groupValue: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    color: selectedFavs.contains(index)
                        ? ColorModel.purple
                        : Colors.grey,
                    size: 18.0,
                  ),
                ),
              ),
            ),
          )
        ],
      );

  // Product tile style
  NeumorphicStyle get productTileStyle => NeumorphicStyle(
        color: ColorModel.neumorphicColor,
        border: NeumorphicBorder(color: Colors.grey.shade200),
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10.0)),
        shape: NeumorphicShape.concave,
      );

  // Appbar
  Widget get appBar => AppBar(
        leading: leadingIcon,
        leadingWidth: 60.0,
        backgroundColor: ColorModel.neumorphicColor,
        elevation: 0.0,
        actions: [actionFilterIcon],
      );

  // Action button - filter icon
  Widget get actionFilterIcon => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: NeumorphicButton(
          margin: const EdgeInsets.all(0.0),
          padding: const EdgeInsets.all(10.0),
          onPressed: () {
          },
          style: leadingStyle,
          child: const Icon(Feather.filter, color: Colors.black87, size: 18.0),
        ),
      );

  // Leading icon - back icon
  Widget get leadingIcon => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: NeumorphicButton(
          margin: const EdgeInsets.all(0.0),
          padding: const EdgeInsets.all(8.0),
          onPressed: () {},
          style: leadingStyle,
          child:
              const Icon(Feather.arrow_left, color: Colors.black87, size: 22.0),
        ),
      );

  // Leading icon style
  NeumorphicStyle get leadingStyle => NeumorphicStyle(
      color: ColorModel.neumorphicColor,
      depth: 3.5,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5.0)),
      shape: NeumorphicShape.concave);
}
