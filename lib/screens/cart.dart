import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jayzapp/screens/product.dart';

class CartItem {
  int productId;
  int quantity;
  CartItem({
    required this.productId,
    required this.quantity,
  });

}
List<CartItem> cartItems=[];


Future<void> populateCartItems() async {
  final user = FirebaseAuth.instance.currentUser!;
  final userId = user.uid;
  final userCartRef = FirebaseFirestore.instance.collection('userCart').doc(userId);

  final snapshot = await userCartRef.get();

  if (snapshot.exists) {
    final cartData = snapshot.data();

    final loadedCartItems = (cartData!['items'] as List<dynamic>).map((itemData) {
      return CartItem(
        productId: itemData['productId'],
        quantity: itemData['quantity'],
      );
    }).toList();

    cartItems.addAll(loadedCartItems); // Add the retrieved items to the existing list
  }
}



int CalculateTotal(List<CartItem> cartitems){
  int Total=0;
  for(int i=0;i<cartitems.length;i++){
    if(cartitems[i].productId<=12){
      int? itemTotal=(cartitems[i].quantity*(pizza[cartitems[i].productId-1].price)) as int?;
      Total=Total+itemTotal!;}
    else if(cartitems[i].productId<=23 && cartitems[i].productId>12){
      int tempId=cartitems[i].productId-12;
      int itemTotal=cartitems[i].quantity*(burger[tempId-1].price);
      Total=Total+itemTotal;
    }
    else if(cartitems[i].productId<=30 && cartitems[i].productId>23){
      int tempId=cartitems[i].productId-23;
      int itemTotal=cartitems[i].quantity*(dessert[tempId-1].price);
      Total=Total+itemTotal;
    }
    else if(cartitems[i].productId<=35 && cartitems[i].productId>30){
      int tempId=cartitems[i].productId-30;
      int itemTotal=cartitems[i].quantity*(breakFast[tempId-1].price);
      Total=Total+itemTotal;
    }
    else if(cartitems[i].productId<=42 && cartitems[i].productId>35){
      int tempId=cartitems[i].productId-35;
      int itemTotal=cartitems[i].quantity*(premiumBurger[tempId-1].price);
      Total=Total+itemTotal;
    }
    else if(cartitems[i].productId<=50 && cartitems[i].productId>42){
      int tempId=cartitems[i].productId-42;
      int itemTotal=cartitems[i].quantity*(salad[tempId-1].price);
      Total=Total+itemTotal;
    }
    else if(cartitems[i].productId<=56 && cartitems[i].productId>50){
      int tempId=cartitems[i].productId-50;
      int itemTotal=cartitems[i].quantity*(shake[tempId-1].price);
      Total=Total+itemTotal;
    }
    else if(cartitems[i].productId<=65 && cartitems[i].productId>56){
      int tempId=cartitems[i].productId-56;
      int itemTotal=cartitems[i].quantity*(wrap[tempId-1].price);
      Total=Total+itemTotal;
    }
    else if(cartitems[i].productId<=74 && cartitems[i].productId>65){
      int tempId=cartitems[i].productId-65;
      int itemTotal=cartitems[i].quantity*(deal[tempId-1].price);
      Total=Total+itemTotal;
    }
  };
  return Total;
}

void clearCartItems() {
  cartItems.clear();
}
