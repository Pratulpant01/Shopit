import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopit/models/address_model.dart';
import 'package:shopit/models/order_model.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/models/userdetail_model.dart';
import 'package:shopit/widgets/product_widget.dart';
import 'package:uuid/uuid.dart';

class OrderServices {
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

  Future uploadOrderedProductsToUser() async {
    List<ProductModel> products = await OrderServices().getOrderedProducts();

    products.forEach((product) async {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('orders')
          .doc(product.uid)
          .set(product.getJson());
    });
  }

  Future uploadOrderToDatabse({
    required List<ProductModel> products,
    required String totalPrice,
    required String shippingAddress,
    required String buyerId,
    required int orderStatus,
  }) async {
    String orderNumber = Uuid().v4();

    OrderModel order = OrderModel(
      totalPrice: totalPrice,
      orderNumber: orderNumber,
      shippingAddress: shippingAddress,
      buyerId: buyerId,
      orderedAt: DateTime.now(),
    );
    products.forEach((product) async {
      await firestore
          .collection('orders')
          .doc(orderNumber)
          .collection('products')
          .doc(product.uid)
          .set(product.getJson());
    });
    await firestore.collection('orders').doc(orderNumber).set(order.getJson());
    await OrderServices().uploadOrderedProductsToUser();
  }

  Future getOrderDetails(String buyerId) async {
    List<OrderModel> ordersList = [];
    final QuerySnapshot<Map<String, dynamic>> orders = await firestore
        .collection('orders')
        .where('buyerId', isEqualTo: buyerId)
        .get();
    orders.docs.forEach((element) {
      OrderModel order = OrderModel.fromJson(element.data());
      ordersList.add(order);
    });
  }

  Stream<List<Widget>> showOrdersToUser() async* {
    List<Widget> orderedProducts = [];
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot = FirebaseFirestore
        .instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('orders')
        .snapshots();

    snapshot.forEach(
      (snap) {
        snap.docs.forEach((element) {
          ProductModel product = ProductModel.fromJson(element.data());
          orderedProducts.add(
            ProductWidget(productModel: product),
          );
        });
      },
    );
    yield orderedProducts;
  }
}

// Future getProductsfromCart(String buyerId, String orderId) async {
//     List<OrderModel> orderedProdcuts = [];
//     List<ProductModel> prodcutList = [];

//     final QuerySnapshot<Map<String, dynamic>> products = await firestore
//         .collection('orders')
//         .doc(orderId)
//         .collection('products')
//         .get();

//     products.docs.forEach((element) {
//       ProductModel product = ProductModel.fromJson(
//         element.data(),
//       );
//       // ProductModel product = ProductModel.fromJson(element['products'].docs);

//       prodcutList.add(product);
//     });

//     print(prodcutList);

//     // products.docs.forEach((element) {
//     //   ProductModel product = ProductModel.fromJson(element['products']);
//     //   orderedProdcuts.add(product);
//     // });
//   }