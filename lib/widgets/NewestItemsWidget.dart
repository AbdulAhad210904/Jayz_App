import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jayzapp/screens/product.dart';
import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';
class NewestItemsWidget extends StatelessWidget {
  const NewestItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(children: [

          //Single Item
          Newest(premiumBurger[0],context),
          //Single Item
          Newest(deal[0],context),
          //Single Item
          Newest(pizza[0],context),
          //Single Item
          Newest(breakFast[0],context),
          //Single Item
          Newest(premiumBurger[2],context),
          //Single Item
          Newest(dessert[0],context),
        ],
        ),
      ),
    );
  }
}
