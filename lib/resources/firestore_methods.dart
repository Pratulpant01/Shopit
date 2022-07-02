import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/models/review_model.dart';
import 'package:shopit/resources/storage_methods.dart';
import 'package:shopit/widgets/product_widget.dart';
import 'package:shopit/widgets/result_widgets.dart';
import 'package:uuid/uuid.dart';

import '../models/userdetail_model.dart';

class FirestoreMethods {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  StorageMethods storageMethods = StorageMethods();
  String getUid = FirebaseAuth.instance.currentUser!.uid;

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
    required List<dynamic> productDescription,
    required String sellerName,
    required String sellerUid,
    required String category,
    required int quantity,
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
          category: category,
          quantity: 0,
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

  Future<List<Widget>> getProductDataFromDiscount(int discount) async {
    List<Widget> products = [];
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('products')
        .where('discount', isEqualTo: discount)
        .get();
    snapshot.docs.forEach((snap) {
      ProductModel product = ProductModel.fromJson(snap.data());
      products.add(
        ProductWidget(productModel: product),
      );
    });
    return products;
  }

  Future<List<Widget>> getProductData() async {
    List<Widget> products = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('products').get();

    snapshot.docs.forEach((snap) {
      ProductModel product = ProductModel.fromJson(snap.data());
      products.add(
        ProductWidget(productModel: product),
      );
    });

    return products;
  }

  Future<String> uploadReviewToDatabase({
    required String senderName,
    required int userRating,
    required String description,
    required String productUid,
  }) async {
    String reviewUid = Uuid().v1();
    String output = 'Something went wrong';
    try {
      ReviewModel review = ReviewModel(
        senderName: senderName,
        userRating: userRating,
        description: description,
      );
      await firestore
          .collection('products')
          .doc(productUid)
          .collection('reviews')
          .doc(reviewUid)
          .set(review.getJson());
      output = 'Review added sucessfully';
    } catch (e) {
      output = e.toString();
    }
    return output;
  }

  Future<List<Widget>> getProductsByCategory(String category) async {
    List<Widget> products = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('products')
          .where('category', isEqualTo: category)
          .get();

      snapshot.docs.forEach((snap) {
        ProductModel product = ProductModel.fromJson(snap.data());
        products.add(
          ResultsWidget(
            product: product,
          ),
        );
      });
    } catch (e) {
      print(e.toString());
    }
    return products;
  }
}

//   Stream<List<ProductModel>> getAllProducts() {
//     return firestore.collection('products').snapshots().map((snapshot) {
//       return snapshot.docs
//           .map((doc) => ProductModel.fromSnapshot(doc))
//           .toList();
//     });
//   }

