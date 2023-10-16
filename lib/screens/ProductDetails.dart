import 'package:clippy_flutter/arc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jayzapp/cart_service.dart';
import 'package:jayzapp/screens/cart.dart';
import 'package:jayzapp/screens/product.dart';
import 'package:jayzapp/widgets/AppBarWidget.dart';
import 'package:jayzapp/widgets/CartBottomNavigationBar.dart';
import 'package:jayzapp/widgets/DrawerWidget.dart';
import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var variable=1;

  @override
  Widget build(BuildContext context) {
    final int Total=variable * widget.product.price;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            AppBarWidget(),
            InteractiveViewer(
              //padding: EdgeInsets.all(16),
              boundaryMargin: EdgeInsets.all(20.0),
              minScale: 0.1,
              maxScale: 2.0,
              child: Image.asset(
                widget.product.image,
                width: 380,
                height: 300,
              ),
            ),
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: 30,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: 60,bottom: 10,right: 10,left: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 18,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (_){},
                          ),
                          Text(
                            "\$${widget.product.price}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 20,right: 10,left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          // Decrease the value of the variable by 1
                                          if (variable > 1) {
                                            variable--;
                                          }
                                        });
                                      },
                                    ),
                                    //SizedBox(width: 5),
                                    Text(
                                      variable.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    //SizedBox(width: 5),
                                    IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          // Increase the value of the variable by 1
                                          variable++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          child: Text(
                            widget.product.description,
                            style: TextStyle(
                              fontSize: 16,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),
            //Add to Cart
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      widget.product.addToCart(variable);
                      print(variable);
                      final cartService = CartService();
                      final user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        final userId = user.uid;
                        // Call the saveCartItemsToFirestore method with the user ID and cart items
                        cartService.saveCartItemsToFirestore(userId, cartItems);
                      }
                      Fluttertoast.showToast(
                        msg: 'Added To Cart',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        //toastDuration: Duration(milliseconds: 2000).inMilliseconds, // Set the duration in milliseconds
                      );

                      print(cartItems.length);
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppBar(widget.product,Total),
      drawer: DrawerWidget(),
    );

  }

}
