import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jayzapp/screens/cart.dart';
import 'package:jayzapp/screens/wishlist.dart';
import 'package:jayzapp/widgets/AppBarWidget.dart';
import 'package:jayzapp/widgets/CategoriesWidget.dart';
import 'package:jayzapp/widgets/NewestItemsWidget.dart';
import 'package:jayzapp/widgets/PopularItemWidget.dart';
import 'package:jayzapp/widgets/DrawerWidget.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import'package:jayzapp/screens/product.dart';
import 'package:jayzapp/wishlist_service.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  List<Product> searchedProducts= [];

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    // final userId = user.uid;
    if(cartItems.isEmpty){populateCartItems();}else{}
    if(wishList.isEmpty){populateWishList();}else{}
    return  Scaffold(
      body: ListView(
        children: [
          //AppBar
          AppBarWidget(),
          //Search Bar
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(CupertinoIcons.search,
                    color: Colors.red,
                  ),
                  Spacer(),
                  Text(
                    'What would you like to have?',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.filter_list)
                ],
              ),
            ),
          ),
          //Categories
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "categories");
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Categories List
          CategoriesWidget(),
          SizedBox(height: 5,),
          //Popular
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' Popular',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "popular");
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Popular List
          PopularItemWidget(),
          //Newest
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' Newest',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          //Newest List
          NewestItemsWidget(),
        ],
      ),
      //Drawer
      drawer: DrawerWidget(),
      //Cart Button
      floatingActionButton: Container(
        decoration:
        BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, "cartpage");
          },
          child: Icon(CupertinoIcons.cart,size: 28,color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ),
      ),

    );
  }
}
