import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopit/models/userdetail_model.dart';
import 'package:shopit/resources/firestore_methods.dart';

class AuthMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirestoreMethods firestoreMethods = FirestoreMethods();

  Future<String> signUpUser(
      {required String name,
      required String address,
      required String email,
      required String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserDetailModel user = UserDetailModel(
          name: name,
          address: address,
        );
        await firestoreMethods.uploadUserDetails(user: user);

        output = "Registration Successful";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill the required fields.";
    }
    return output;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "Login Successful";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill the required fields";
    }
    return output;
  }
}
