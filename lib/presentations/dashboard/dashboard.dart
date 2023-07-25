import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shopping_neumorphic/commons/common.textfield.dart';
import 'package:shopping_neumorphic/commons/common.vars.dart';
import 'package:shopping_neumorphic/commons/common.widgets.dart';
import 'package:shopping_neumorphic/controllers/product.controller.dart';
import 'package:shopping_neumorphic/models/color.model.dart';
import 'package:shopping_neumorphic/presentations/dashboard/dashboard.products.dart';

import 'dashboard.categories.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  // Importing product controller
  final productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          CommonWidgets.spacer(height: 15),
          topSection,
          categories,
          CommonWidgets.spacer(height: 5),
          DashboardProducts()
        ]));
  }

  Widget get categories => DashboardCategories();

  Widget get topSection => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(children: [
          searchSection,
          CommonWidgets.spacer(width: 25),
          CommonCartSection()
        ]),
      );

  Widget get searchSection => Expanded(
      child: Container(
          alignment: Alignment.centerLeft,
          height: searchContainerHeight,
          decoration: searchDecoration,
          child: searchContainerChild));

  Widget get searchContainerChild => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(children: [
          searchIcon,
          CommonWidgets.spacer(width: 10),
          searchText
        ]),
      );

  Widget get searchText => Text("Search for items", style: searchTextStyle);

  TextStyle get searchTextStyle =>
      TextStyle(fontSize: 14, color: Colors.black26);

  Widget get searchIcon =>
      Icon(Feather.search, size: searchIconSize, color: searchIconColor);

  Color get searchIconColor => Colors.black26;

  double searchIconSize = 20;

  double searchContainerHeight = 50;

  Decoration get searchDecoration =>
      BoxDecoration(borderRadius: searchBorderRadius, border: searchBorder);

  Border get searchBorder => Border.all(color: Colors.black12);

  BorderRadius get searchBorderRadius => BorderRadius.circular(5);
}
