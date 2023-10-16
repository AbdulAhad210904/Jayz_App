import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jayzapp/screens/cart.dart';

class CartService {

  Future<void> saveCartItemsToFirestore(String userId, List<CartItem> cartItems) async {
    final userCartRef = FirebaseFirestore.instance.collection('userCart').doc(userId);
    final cartItemsData = cartItems.map((item) {
      return {
        'productId': item.productId,
        'quantity': item.quantity,
      };
    }).toList();
    await userCartRef.set({'items': cartItemsData});
  }

  Future<List<CartItem>> loadCartItemsFromFirestore(String userId) async {
    if (cartItems.isNotEmpty) {
      return cartItems; // Return the existing items if the list is already populated
    }

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

      return loadedCartItems;
    }
    return []; // Return an empty list if the user's cart document doesn't exist
  }

/*Future<void> saveCartItemsToFirestore(String userId, List<CartItem> cartItems) async {
    final userCartRef = FirebaseFirestore.instance.collection('userCart').doc(userId);

    final cartItemsData = cartItems.map((item) {
      return {
        'productId': item.productId,
        'quantity': item.quantity,
      };
    }).toList();

    await userCartRef.set({'items': cartItemsData});
  }
 /* Future<void> saveCartItemsToFirestore(String userId, List<CartItem> cartItems) async {
    final userCartRef = FirebaseFirestore.instance.collection('userCart').doc(userId);

    // Fetch the existing cart items from Firestore
    final existingCartItems = await loadCartItemsFromFirestore(userId);

    // Merge the existing cart items with the new cart items
    final mergedCartItems = [...existingCartItems, ...cartItems];

    final cartItemsData = mergedCartItems.map((item) {
      return {
        'productId': item.productId,
        'quantity': item.quantity,
      };
    }).toList();

    await userCartRef.set({'items': cartItemsData});
  }
*/
  Future<List<CartItem>> loadCartItemsFromFirestore(String userId) async {
    final userCartRef = FirebaseFirestore.instance.collection('userCart').doc(userId);

    final snapshot = await userCartRef.get();

    if (snapshot.exists) {
      final cartData = snapshot.data();

      final cartItems = (cartData!['items'] as List<dynamic>).map((itemData) {
        return CartItem(
          productId: itemData['productId'],
          quantity: itemData['quantity'],
        );
      }).toList();

      return cartItems;
    }

    return []; // Return an empty list if the user's cart document doesn't exist
  }*/
}
