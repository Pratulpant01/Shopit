import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../../resources/storage_methods.dart';

class AddToCartServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  StorageMethods storageMethods = StorageMethods();
  String getUid = FirebaseAuth.instance.currentUser!.uid;

  Future<String> addProductToCart(
    ProductModel productModel,
  ) async {
    String result = 'Something went wrong';
    try {
      await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('cart')
          .doc(productModel.uid)
          .set(productModel.getCartJson());

      result = 'Added to cart';
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<String> deleteProductFromCart(String uid) async {
    String result = 'Something went wrong';
    try {
      await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('cart')
          .doc(uid)
          .delete();
      result = 'Product deleted sucessfully';
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future getSubtotalCartPrice(String uid) async {
    int sum = 0;
    QuerySnapshot priceData = await firestore
        .collection('users')
        .doc(getUid)
        .collection('cart')
        .where('price')
        .get();
  }

  Future<int> getProductQuantity(String productUid) async {
    int quantity = 0;
    DocumentSnapshot productQuantity = await firestore
        .collection('users')
        .doc(getUid)
        .collection('cart')
        .doc(productUid)
        .get();
    return productQuantity['quantity'];
  }

  Future updateAddToCartProduct(
    String productUid,
  ) async {
    int quantity = await AddToCartServices().getProductQuantity(productUid);
    await firestore
        .collection('users')
        .doc(getUid)
        .collection('cart')
        .doc(productUid)
        .update({
      'quantity': quantity + 1,
    });

    print(quantity);
  }

  Future checkProductinCart(String productUid) async {
    bool isAdded = false;

    QuerySnapshot<Map<String, dynamic>> snap = await firestore
        .collection('users')
        .doc(getUid)
        .collection('cart')
        .where('productUid', isEqualTo: productUid)
        .get();
    print(snap.docs.length);
    if (snap.docs.length != 0) {
      isAdded = true;
    } else {
      isAdded = false;
    }
    return isAdded;
  }

  Future<String> removeProductQuantity(String uid, int quantity) async {
    String result = 'Something went wrong';

    await firestore
        .collection('users')
        .doc(getUid)
        .collection('cart')
        .doc(uid)
        .update({
      'quantity': quantity - 1,
    });
    result = 'Product removed sucessfully';

    return result;
  }
}
