import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopit/resources/auth_methods.dart';
import 'package:shopit/resources/firestore_methods.dart';

import '../../../screens/signin_screen.dart';
import '../../../utils/utils.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthMethods authMethods;
  FirestoreMethods firestoreMethods = FirestoreMethods();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthBloc(this.authMethods) : super(AuthInitial()) {
    on<SignUpUserEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await authMethods.signUpUser(
        name: event.name,
        address: event.address,
        email: event.emailId,
        password: event.password,
      );
      if (result == 'Registration Successful') {
        Utils().showsnackBar(
          context: event.context,
          message: result,
        );
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => SigninScreen(),
          ),
        );
      } else {
        Utils().showsnackBar(
          context: event.context,
          message: result,
        );
      }
      emit(AuthLoaded());
    });
// To login user using existing email and password.

    on<SigninUserEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await authMethods.signInUser(
        email: event.email,
        password: event.password,
      );
      if (result == 'Login Successful') {
        Utils().showsnackBar(
          context: event.context,
          message: result,
        );
      } else {
        Utils().showsnackBar(
          context: event.context,
          message: result,
        );

        emit(AuthLoaded());
      }
    });
  }
}
