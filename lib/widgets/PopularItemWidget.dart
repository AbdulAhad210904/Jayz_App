import 'package:flutter/material.dart';
import 'package:jayzapp/screens/product.dart';
import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';
class PopularItemWidget extends StatelessWidget {
  const PopularItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 5),
        child: Row(
          children: [
            //Single Item
            Popular(premiumBurger[0],context),
            //Single Item
            Popular(premiumBurger[0],context),
            //Single Item
            Popular(pizza[6],context),
            //Single Item
            Popular(premiumBurger[0],context),
            //Single Item
            Popular(premiumBurger[0],context),
          ],
        ),
      ),
    );
  }
}
