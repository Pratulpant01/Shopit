import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopit/models/address_model.dart';
import 'package:shopit/models/order_model.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/models/userdetail_model.dart';
import 'package:uuid/uuid.dart';

class AddressServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future uploadUserAddress(AddressModel address) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('address')
        .doc(Uuid().v1())
        .set(address.getJson());
  }

  Future<List<ProductModel>> getOrderedProducts() async {
    List<ProductModel> products = [];
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get();

    snapshot.docs.forEach((snap) {
      ProductModel product = ProductModel.fromJson(snap.data());
      products.add(product);
    });
    return products;
  }

  Future uploadOrderToDatabse({
    required List<ProductModel> products,
    required String totalPrice,
    required String shippingAddress,
    required String buyerId,
    required DateTime orderedAt,
    required int orderStatus,
  }) async {
    String orderUid = Uuid().v1();

    OrderModel order = OrderModel(
      product: products,
      totalPrice: totalPrice,
      shippingAddress: shippingAddress,
      buyerId: buyerId,
      orderedAt: orderedAt,
    );

    await firestore.collection('orders').doc(orderUid).set(order.getJson());
  }
}
