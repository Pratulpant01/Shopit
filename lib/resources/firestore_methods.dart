import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

import '../models/userdetail_model.dart';

class FirestoreMethods {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  StorageMethods storageMethods = StorageMethods();

  Future uploadUserDetails({required UserDetailModel user}) async {
    await firestore.collection('users').doc(firebaseAuth.currentUser!.uid).set(
          user.getJson(),
        );
  }

  Future<UserDetailModel> getUserDetails() async {
    final userSnap = await firestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    final userData = UserDetailModel.fromJson(userSnap.data()!);

    return userData;
  }

  Future<String> uploadProductToDatabse({
    required Uint8List? image,
    required String productName,
    required String rawCost,
    required int productDiscount,
    required List<String>? productDescription,
    required String sellerName,
    required String sellerUid,
  }) async {
    productName.trim();
    rawCost.trim();
    String output = 'Something went wrong';

    if (image != null && productName != null && rawCost != null) {
      try {
        String productUid = Uuid().v1();
        String imageUrl =
            await storageMethods.uploadImageToStorage(productUid, image);
        double cost = double.parse(rawCost);
        cost = cost - (cost * (productDiscount / 100));
        ProductModel product = ProductModel(
          productName: productName,
          imgUrl: imageUrl,
          price: cost,
          discount: productDiscount,
          description: productDescription,
          uid: productUid,
          sellerName: sellerName,
          sellerUid: sellerUid,
          rating: 5,
          numberOfRating: 0,
        );

        await firestore
            .collection('products')
            .doc(productUid)
            .set(product.getJson());

        output = 'Product added sucessfully';
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = 'Please fill all the required fields';
    }
    return output;
  }
}
