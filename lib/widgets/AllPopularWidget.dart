import 'package:flutter/material.dart';
import 'package:jayzapp/screens/product.dart';
import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';

class AllPopularWidget extends StatelessWidget {
  const AllPopularWidget({Key? key}) : super(key: key);

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
              'Popular',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Our Most Popular Items',
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
                Popular2(premiumBurger[0],context),
                SizedBox(width: 9,),
                //Single Item
                Popular2(burger[6],context),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                //Single Item
                Popular2(pizza[1],context),
                SizedBox(width: 9,),
                //Single Item
                Popular2(pizza[3],context),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                //Single Item
                Popular2(deal[0],context),
                SizedBox(width: 9,),
                //Single Item
                Popular2(deal[1],context),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                //Single Item
                Popular2(premiumBurger[0],context),
                SizedBox(width: 9,),
                //Single Item
                Popular2(dessert[0],context),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                //Single Item
                Popular2(wrap[1],context),
                SizedBox(width: 9,),
                //Single Item
                Popular2(breakFast[1],context),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
