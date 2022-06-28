import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopit/models/product_model.dart';

import '../models/userdetail_model.dart';

class FirestoreMethods {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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

  Future<String> uploadProductToDatabse(
      {required Uint8List? imageUrl,
      required String productName,
      required String rawCost,
      required int productDiscount,
      required List productDescription,
      required String sellerName,
      required String sellerUid,
      required int rating,
      required int noOfRating}) async {
    productName.trim();
    rawCost.trim();
    String output = 'Something went wrong';

    if (imageUrl != null &&
        productName != null &&
        rawCost != null &&
        productDescription != null) {
    } else {
      output = 'Please fill all the required fields';
    }
  }
}
