import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jayzapp/screens/product.dart';
class WishList {
  int productId;
  WishList({
    required this.productId,
  });
}
List<WishList> wishList=[];

Future<void> populateWishList() async {
  final user = FirebaseAuth.instance.currentUser!;
  final userId = user.uid;
  final userCartRef = FirebaseFirestore.instance.collection('WishList').doc(userId);
  final snapshot = await userCartRef.get();

  if (snapshot.exists) {
    final WishListData = snapshot.data();

    final loadedCartItems = (WishListData!['items'] as List<dynamic>).map((itemData) {
      return WishList(
        productId: itemData['productId'],
      );
    }).toList();

    wishList.addAll(loadedCartItems); // Add the retrieved items to the existing list
  }
}
void clearWishList() {
  wishList.clear();
}
