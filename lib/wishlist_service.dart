import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jayzapp/screens/wishlist.dart';


class WishListService {

  Future<void> saveWishListToFirestore(String userId,
      List<WishList> wishList) async {
    final userWishListRef = FirebaseFirestore.instance.collection('WishList').doc(
        userId);
    final WishListData = wishList.map((item) {
      return {
        'productId': item.productId,
      };
    }).toList();
    await userWishListRef.set({'items': WishListData});
  }

  Future<List<WishList>> loadWishListFromFirestore(String userId) async {
    if (wishList.isNotEmpty) {
      return wishList; // Return the existing items if the list is already populated
    }

    final userWishListRef = FirebaseFirestore.instance.collection('WishList').doc(
        userId);
    final snapshot = await userWishListRef.get();

    if (snapshot.exists) {
      final WishListData = snapshot.data();
      final loadedWishList = (WishListData!['items'] as List<dynamic>).map((
          itemData) {
        return WishList(
          productId: itemData['productId'],
        );
      }).toList();

      wishList.addAll(
          loadedWishList); // Add the retrieved items to the existing list

      return loadedWishList;
    }
    return []; // Return an empty list if the user's cart document doesn't exist
  }

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

}