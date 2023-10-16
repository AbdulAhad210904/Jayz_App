import 'package:flutter/material.dart';
import 'package:jayzapp/screens/product.dart';
import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10), // Adjust the duration as needed
    );

    _animationController.addListener(() {
      final double maxScrollExtent = _scrollController.position.maxScrollExtent;
      final double offset = _animationController.value * maxScrollExtent;

      if (maxScrollExtent <= offset) {
        _scrollController.jumpTo(0);
      } else {
        _scrollController.jumpTo(offset);
      }
    });

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _stopAnimation() {
    _animationController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) => _stopAnimation(),
      onPanStart: (_) => _stopAnimation(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(), // Enable scrolling when user holds the scroll
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              //Single Item
              Category(categoryPremiumBurgers, context),
              //Single Item
              Category(categoryBurger, context),
              //Single Item
              Category(categoryPizza, context),
              //Single Item
              Category(categoryDeals, context),
              //Single Item
              Category(categoryWraps, context),
              //Single Item
              Category(categoryBreakFast, context),
              //Single Item
              Category(categoryDessert, context),
              //Single Item
              Category(categoryShakes, context),
              //Single Item
              Category(categorySalads, context),
            ],
          ),
        ),
      ),
    );
  }
}
