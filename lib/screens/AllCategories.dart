import 'package:flutter/material.dart';
import 'package:jayzapp/widgets/AppBarWidget.dart';
import 'package:jayzapp/widgets/DrawerWidget.dart';
import '../widgets/AllCategories Widget.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(),
          //All Categories
          AllCategoriesWidget(),
        ],
      ),
      drawer: DrawerWidget(),
    );
  }
}
