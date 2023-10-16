import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';
import 'package:jayzapp/screens/product.dart';
import 'package:jayzapp/screens/wishlist.dart';
import 'package:jayzapp/widgets/AppBarWidget.dart';

import '../widgets/DrawerWidget.dart';
import '../widgets/WishListWidget.dart';
import '../wishlist_service.dart';
class WIshList extends StatefulWidget {
   WIshList({Key? key}) : super(key: key);

  @override
  State<WIshList> createState() => _WIshListState();
}


class _WIshListState extends State<WIshList> {
  List<Product> MergedList=[
    ...pizza,
    ...burger,
    ...dessert,
    ...breakFast,
    ...premiumBurger,
    ...salad,
    ...shake,
    ...wrap,
    ...deal,
  ];

  void removeFromWishList(int index) {
    setState(() {
      wishList.removeAt(index);
    });
  }

  Widget dis(int id,int index){
    //List<Product> filteredList=MergedList.where((product) => product.productId==id).toList();
    //MergedList.contains(id);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Container(
        width: 380,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                MergedList[id-1].image,
                width: 150,
                height: 80,
              ),
            ),
            Container(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    MergedList[id-1].name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    MergedList[id-1].tagLine,
                    style: TextStyle(
                      fontSize: 15,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      "\$${MergedList[id-1].price}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 40,),
            GestureDetector(
              onTap: () {
                removeFromWishList(index);
                final wishListService=WishListService();
                final user=FirebaseAuth.instance.currentUser;
                if(user!=null){
                  final userid=user.uid;
                  wishListService.saveWishListToFirestore(userid, wishList);
                }
                print(wishList.length);
              },
              child: Icon(
                Icons.cancel,
                color: Colors.red,
                size: 46,
              ),
            ),

          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount: wishList.length + 2, // Adding 2 for AppBarWidget and WishListWidget
        itemBuilder: (context, index) {
          if (index == 0) {
            return AppBarWidget();
          } else if (index == 1) {
            return WishListWidget();
          } else {
            final wishListIndex = index - 2;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 380,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: dis(wishList[wishListIndex].productId, wishListIndex),
              ),
            );
          }
        },
      ),
      drawer: DrawerWidget(),
    );

  }
}
