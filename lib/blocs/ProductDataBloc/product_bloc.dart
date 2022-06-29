import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/resources/firestore_methods.dart';

import '../../utils/utils.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  FirestoreMethods firestoreMethods;
  ProductBloc(this.firestoreMethods) : super(ProductInitial()) {
    on<UploadProductEvent>(
      (event, emit) async {
        emit(ProductLoading());
        final result = await firestoreMethods.uploadProductToDatabse(
          image: event.image,
          productName: event.productName,
          rawCost: event.rawCost,
          productDiscount: event.productDiscount,
          productDescription: event.productDescription,
          sellerName: event.sellerName,
          sellerUid: event.sellerUid,
          category: event.category,
        );
        if (result == 'Registration Successful') {
          Utils().showsnackBar(
            context: event.context,
            message: result,
          );
        } else {
          Utils().showsnackBar(
            context: event.context,
            message: result,
          );
        }
        emit(ProductLoaded());
      },
    );
  }
}
