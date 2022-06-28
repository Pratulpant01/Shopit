import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopit/blocs/UserDataBloc/firestore_bloc.dart';

class StorageMethods {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Future<String> uploadImageToStorage(String uid, Uint8List file) async {
    Reference storageRef =
        await firebaseStorage.ref().child('products').child(uid);
    UploadTask uploadTask = storageRef.putData(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    Future<String> imageUrl = taskSnapshot.ref.getDownloadURL();

    return imageUrl;
  }
}
