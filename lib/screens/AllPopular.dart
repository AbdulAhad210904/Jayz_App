import 'package:flutter/material.dart';
import 'package:jayzapp/widgets/AppBarWidget.dart';

import '../widgets/AllCategories Widget.dart';
import '../widgets/AllPopularWidget.dart';
import '../widgets/DrawerWidget.dart';
class AllPopular extends StatelessWidget {
  const AllPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(),
          //All Categories
          AllPopularWidget(),
        ],
      ),
      drawer: DrawerWidget(),
    );
  }
}
