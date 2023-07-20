import 'package:flutter/material.dart';
import 'package:shopping_neumorphic/models/color.model.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: appbarTitle,
          elevation: 3,
          leading: leading,
          backgroundColor: AppColors.purple),
      
    );
  }

  // Leading widget
  Widget get leading => Icon(Icons.menu, color: Colors.white);

  // App bar title
  Widget get appbarTitle =>
      Text(appbarTitleString, style: TextStyle(color: Colors.white));

  // App bar string
  String get appbarTitleString => "Dashboard";
}
