import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shopping_neumorphic/commons/common.vars.dart';
import 'package:shopping_neumorphic/models/color.model.dart';
import 'package:shopping_neumorphic/presentations/dashboard/dashboard.dart';

class CommonScaffold extends StatelessWidget {
  CommonScaffold({super.key});

  // List of bottom navigation bar items title
  List<String> bottomNavItems = ["Home", "Categories", "Cart", "Settings"];

  // List of bottom navigation bar items icon
  List<IconData> bottomNavItemIcons = [
    Feather.home,
    Feather.archive,
    Feather.shopping_cart,
    Feather.settings
  ];

  List<Widget> screens = [Dashboard(), Dashboard(), Dashboard(), Dashboard()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: CommonVars.selectedBottomIndex,
        builder: (context, selectedIndex, child) {
          return Scaffold(
            backgroundColor: Color(0xFFe9ebea),
            bottomNavigationBar: bottomNavigationBarWidget,
            body: screens[selectedIndex],
          );
        });
  }

  // Bottom navigation bar widget
  Widget get bottomNavigationBarWidget => ValueListenableBuilder<int>(
      valueListenable: CommonVars.selectedBottomIndex,
      builder: (context, selectedIndex, child) {
        return BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              CommonVars.selectedBottomIndex.value = value;
            },
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.purple,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            iconSize: 20,
            selectedLabelStyle: TextStyle(fontSize: 13),
            unselectedFontSize: 12.5,
            items: List.generate(
                bottomNavItems.length, (index) => bottomNavBarItemTile(index)));
      });

  // Bottom navigatio bar items tile
  BottomNavigationBarItem bottomNavBarItemTile(index) =>
      BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(bottomNavItemIcons[index]),
          label: bottomNavItems[index]);
}
