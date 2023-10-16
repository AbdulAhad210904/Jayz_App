import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';
import 'package:jayzapp/screens/cart.dart';
import 'package:jayzapp/cart_service.dart';
import 'package:jayzapp/screens/product.dart';
import 'package:jayzapp/widgets/AppBarWidget.dart';
import 'package:jayzapp/widgets/DrawerWidget.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void performCheckout() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final documentId = user.uid; // Replace with the actual document ID
      final collectionPath = 'userCart'; // Replace with the actual collection path

      FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(documentId)
          .delete()
          .then((_) {
        // Document successfully deleted

        // Clear the cartItems list
        setState(() {
          cartItems.clear();
        });
      }).catchError((error) {
        // An error occurred while deleting the document
        print('Failed to delete document: $error');
      });
    }
  }

  void addToCart(CartItem i) {
    int existingIndex = cartItems.indexWhere((item) => item.productId == i.productId);
    if (existingIndex >= 0) {
      cartItems[existingIndex].quantity = i.quantity;
    } else {
      // Add the new product to the cart
      cartItems.add(i);
    }
  }
  void updateCart(CartItem i) {
    if(i.quantity==0){}
    else{addToCart(i);}

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      // Call the saveCartItemsToFirestore method with the user ID and cart items
      CartService().saveCartItemsToFirestore(userId, cartItems);
    }
  }
  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      setState(() {
        int Q=cartItems[index].quantity-1;
        cartItems[index].quantity=Q;
      });
    }
    else if(cartItems[index].quantity==1){
      setState(() {
        int Q=cartItems[index].quantity-1;
        cartItems[index].quantity=Q;
        cartItems.removeAt(index);
      });
    }
  }
  void incrementQuantity(int index) {
    setState(() {
      int Q=cartItems[index].quantity+1;
      cartItems[index].quantity=Q;
    });
  }
  Widget BuildCartProduct(CartItem item,index){
    if (cartItems == null || cartItems.isEmpty || item.quantity == 0) {
      return Container(); // Return an empty container or a placeholder widget
    }
    else if(item.productId<=12){return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            pizza[item.productId-1].image,
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
                pizza[item.productId-1].name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                pizza[item.productId-1].tagLine,
                style: TextStyle(
                  fontSize: 15,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$ ${pizza[item.productId-1].price*item.quantity}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    decrementQuantity(index);
                    updateCart(item);
                    print(item.quantity);
                  },
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                Text(
                  item.quantity.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    incrementQuantity(index);
                    updateCart(item);
                    print(item.quantity);
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );}
    //12 products done
    else if(item.productId<=23 && item.productId>12){
      int i=item.productId-12;
      return Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              burger[i-1].image,
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
                  burger[i-1].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  burger[i-1].tagLine,
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ ${burger[i-1].price*item.quantity}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      decrementQuantity(index);
                      updateCart(item);
                      print(item.quantity);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      incrementQuantity(index);
                      print(item.quantity);
                      updateCart(item);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );}
    //23 products done
    else if(item.productId<=30 && item.productId>23){
      int i=item.productId-23;
      return Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              dessert[i-1].image,
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
                  dessert[i-1].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dessert[i-1].tagLine,
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ ${dessert[i-1].price*item.quantity}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      decrementQuantity(index);
                      updateCart(item);
                      print(item.quantity);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      incrementQuantity(index);
                      print(item.quantity);
                      updateCart(item);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    //30 products done
    else if(item.productId<=35 && item.productId>30){
      int i=item.productId-30;
      return Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              breakFast[i-1].image,
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
                  breakFast[i-1].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  breakFast[i-1].tagLine,
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ ${breakFast[i-1].price*item.quantity}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      decrementQuantity(index);
                      updateCart(item);
                      print(item.quantity);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      incrementQuantity(index);
                      print(item.quantity);
                      updateCart(item);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    //35 products done
    else if(item.productId<=42 && item.productId>35){
      int i=item.productId-35;
      return Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              premiumBurger[i-1].image,
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
                  premiumBurger[i-1].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  premiumBurger[i-1].tagLine,
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ ${premiumBurger[i-1].price*item.quantity}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      decrementQuantity(index);
                      updateCart(item);
                      print(item.quantity);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      incrementQuantity(index);
                      print(item.quantity);
                      updateCart(item);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    //42 products done
    else if(item.productId<=50 && item.productId>42){
      int i=item.productId-42;
      return Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              salad[i-1].image,
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
                  salad[i-1].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  salad[i-1].tagLine,
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ ${salad[i-1].price*item.quantity}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      decrementQuantity(index);
                      updateCart(item);
                      print(item.quantity);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      incrementQuantity(index);
                      print(item.quantity);
                      updateCart(item);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    //50 products done
    else if(item.productId<=56 && item.productId>50){
      int i=item.productId-50;
      return Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              shake[i-1].image,
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
                  shake[i-1].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  shake[i-1].tagLine,
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ ${shake[i-1].price*item.quantity}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      decrementQuantity(index);
                      updateCart(item);
                      print(item.quantity);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      incrementQuantity(index);
                      print(item.quantity);
                      updateCart(item);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    //56 products done
    else if(item.productId<=65 && item.productId>56){
      int i =item.productId-56;
      return Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              wrap[i-1].image,
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
                  wrap[i-1].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  wrap[i-1].tagLine,
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ ${wrap[i-1].price*item.quantity}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      decrementQuantity(index);
                      updateCart(item);
                      print(item.quantity);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      incrementQuantity(index);
                      print(item.quantity);
                      updateCart(item);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    //65 products done
    else if(item.productId<=74 && item.productId>65){
      int i=item.productId-65;
      //item.productId=item.productId-65;
      return Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              deal[i-1].image,
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
                  deal[i-1].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  deal[i-1].tagLine,
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ ${deal[i-1].price*item.quantity}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      decrementQuantity(index);
                      updateCart(item);
                      print(item.quantity);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      incrementQuantity(index);
                      print(item.quantity);
                      updateCart(item);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      );
    }
    //74 products done
    else{return Row();}

  }

  @override
  Widget build(BuildContext context) {
    int Total=CalculateTotal(cartItems);
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarWidget(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Order List",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  for(int i = 0; i < cartItems.length; i++)
                    Padding(
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
                        child: BuildCartProduct(cartItems[i],i),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                    child: Container(
                      padding: EdgeInsets.all(20),
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                //displaying CalculateTotal() function output
                                '\$ ${Total}'
                                ,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery Fee",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$ 2.00",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$ ${Total+2}'
                                ,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red, // Set the desired color
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Confirmation'),
                                    content: Text('Are You sure? Your order will be delivered to your address and we will collect the bill as well.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          performCheckout();
                                          cartItems.clear();
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('CheckOut'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      //bottomNavigationBar: CartBottomNavigationBar(),
    );
  }
}
