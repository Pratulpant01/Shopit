import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/userdetail_model.dart';

class FirestoreMethods {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadUserDetails({required UserDetailModel user}) async {
    await firestore.collection('users').doc(firebaseAuth.currentUser!.uid).set(
          user.getJson(),
        );
  }

  getUserDetails() async {
    var userSnap = await firestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    return userSnap;
  }
}
