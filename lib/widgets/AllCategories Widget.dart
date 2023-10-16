import 'package:flutter/material.dart';
import 'package:jayzapp/screens/product.dart';
import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';
class AllCategoriesWidget extends StatelessWidget {
  const AllCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15),
        child: Column(
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'All Categories We Offer',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                //Single Item
                Category2(categoryPremiumBurgers,context),
                SizedBox(width: 9,),
                //Single Item
                Category2(categoryBurger,context),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                //Single Item
                Category2(categoryPizza,context),
                SizedBox(width: 9,),
                //Single Item
                Category2(categoryDeals,context),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                //Single Item
                Category2(categoryWraps,context),
                SizedBox(width: 9,),
                //Single Item
                Category2(categoryShakes,context),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                //Single Item
                Category2(categoryBreakFast,context),
                SizedBox(width: 9,),
                //Single Item
                Category2(categoryDessert,context),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                //Single Item
                Category2(categorySalads,context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
