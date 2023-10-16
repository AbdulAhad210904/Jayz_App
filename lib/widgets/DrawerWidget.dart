import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jayzapp/screens/AllCategories.dart';
import 'package:jayzapp/screens/CartPage.dart';
import 'package:jayzapp/screens/AboutUs.dart';
import 'package:jayzapp/screens/cart.dart';
import 'package:jayzapp/screens/home_page.dart';
import 'package:jayzapp/screens/profile.dart';
import 'package:jayzapp/screens/signin_screen.dart';
import 'package:jayzapp/screens/support.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/WishListPage.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                accountName: Text(FirebaseAuth.instance.currentUser!.uid.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
                accountEmail: Text(FirebaseAuth.instance.currentUser!.email.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
                ),
              currentAccountPicture: CircleAvatar(backgroundImage:
                AssetImage("images/avatar.jpg"),),
              ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: ListTile(
              leading: Icon(
                Icons.home_filled,
                color: Colors.red,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          GestureDetector(
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              leading: Icon(
                CupertinoIcons.person_fill,
                color: Colors.red,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: ListTile(
              leading: Icon(
                CupertinoIcons.cart_fill,
                color: Colors.red,
              ),
              title: Text(
                "My Orders",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WIshList()));
            },
            child: ListTile(
              leading: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.red,
              ),
              title: Text(
                "My Wish List",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllCategories()));
            },
            child: ListTile(
              leading: Icon(
                Icons.category,
                //MaterialIcons.fastfood,
                color: Colors.red,

              ),
              title: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Support()));
            },
            child: ListTile(
              leading: Icon(
                Icons.support_agent,
                color: Colors.red,
              ),
              title: Text(
                "Customer Support",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          GestureDetector(
            child: ListTile(
              onTap: () {
                clearCartItems();
                FirebaseAuth.instance.signOut().then((value) async {
                  print("Signed Out");
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', false);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                });
              },
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),

              ),

            ),
          ),
        ],
      ),
    );
  }
}
