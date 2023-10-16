import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jayzapp/screens//cart.dart';
import 'package:jayzapp/screens/product.dart';
import 'package:jayzapp/screens/ProductDetails.dart';
import 'package:jayzapp/screens/wishlist.dart';
import 'package:jayzapp/widgets/CategoryDetails.dart';
import '../wishlist_service.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.4),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
Container SigninSignupButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white70;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
Padding Category(Product product,BuildContext context){
  return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10),
      child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDeatils(product: product),
                ),
              );
            },
            child: Column(
              children: [
                Image.asset(
                  product.image,
                  width: 80,
                  height: 70,
                ),
                Text(product.category,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ],
            ),
          )
      )
  );
}
Padding Popular(Product product,BuildContext context){
  return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 8),
      child: Container(
        height: 150,
        width: 140,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(product: product),
              ),
            );
          },
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  product.image,
                  width: 100,
                  height: 70,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.tagLine,
                  style: TextStyle(
                    color: Colors.black54.withOpacity(0.7),
                    fontSize: 9,
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("\$${product.price}",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      product.isFavourite=true;
                      product.addToWishList();
                      final wishListService=WishListService();
                      final user=FirebaseAuth.instance.currentUser;
                      if(user!=null){
                        final userid=user.uid;
                        wishListService.saveWishListToFirestore(userid, wishList);
                      };
                      Fluttertoast.showToast(
                        msg: 'Added To Wishlist',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        //toastDuration: Duration(milliseconds: 2000).inMilliseconds, // Set the duration in milliseconds
                      );
                      print(wishList.length);
                    },
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
  );
}
Padding Category2(Product product,BuildContext context){
  return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 8),
      child: Container(
        height: 150,
        width: 160,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryDeatils(product: product),
              ),
            );
          },
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  product.image,
                  width: 100,
                  height: 100,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  product.category,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5,),
            ],
          ),
        ),
      )
  );
}
Padding Popular2(Product product,BuildContext context){
  return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 8),
      child: Container(
        height: 160,
        width: 160,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(product: product),
              ),
            );
          },
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  product.image,
                  width: 100,
                  height: 73,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.tagLine,
                  style: TextStyle(
                    color: Colors.black54.withOpacity(0.7),
                    fontSize: 11,
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("\$${product.price}",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      product.isFavourite=true;
                      product.addToWishList();
                      final wishListService=WishListService();
                      final user=FirebaseAuth.instance.currentUser;
                      if(user!=null){
                        final userid=user.uid;
                        wishListService.saveWishListToFirestore(userid, wishList);
                      };
                      Fluttertoast.showToast(
                        msg: 'Added To WishList',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        //toastDuration: Duration(milliseconds: 2000).inMilliseconds, // Set the duration in milliseconds
                      );
                      print(wishList.length);
                    },
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 26,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
  );
}
Padding Newest(Product product,BuildContext context){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 380,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(product: product),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(product.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Container(
              width: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(product.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  Text(product.tagLine,
                      style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.bold,
                      )
                  ),
                  RatingBar.builder(
                    initialRating: 4.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 18,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    onRatingUpdate: (index) {},
                  ),
                  Text("\$${product.price}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      )
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      product.isFavourite=true;
                      product.addToWishList();
                      final wishListService=WishListService();
                      final user=FirebaseAuth.instance.currentUser;
                      if(user!=null){
                        final userid=user.uid;
                        wishListService.saveWishListToFirestore(userid, wishList);
                      };
                      Fluttertoast.showToast(
                        msg: 'Added To WishList',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        //toastDuration: Duration(milliseconds: 2000).inMilliseconds, // Set the duration in milliseconds
                      );
                      print(wishList.length);
                    },
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 26,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
  );
}
Align OneCategory(Product product,BuildContext context){
  return Align(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDeatils(product: product),
            ),
          );
        },
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(product: product),
              ),
            );
          },
          child: Container(
            width: 170,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
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
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(product.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(product.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      Text(product.tagLine,
                          style: TextStyle(
                            fontSize: 14,
                            //fontWeight: FontWeight.bold,
                          )
                      ),
                      Text("\$${product.price}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
BottomAppBar bottomAppBar(Product product,var total){
  return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Total: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  "\$$total",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      )
  );
}
BottomAppBar bottomAppBar2(var total){
  return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Total: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  "\$$total",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Order Now",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      )
  );
}
//ID 1-12 pizza                 |Total: 12
//ID 13-23 burger               |Total: 11
//ID 24-30 dessert              |Total: 7
//ID 31-35 breakfast            |Total: 5
//ID 36-42 premiumBurger        |Total: 7
//ID 43-50 salad                |Total: 8
//ID 51-56 shake                |Total: 6
//ID 57-65 wrap                 |Total: 9
//ID 66-74 deals                |Total: 9