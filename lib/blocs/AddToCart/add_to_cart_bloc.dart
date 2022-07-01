import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/resources/firestore_methods.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  FirestoreMethods firestoreMethods;
  AddToCartBloc(this.firestoreMethods) : super(AddToCartLoading()) {
    on<AddProductToDatabase>((event, emit) async {
      final result =
          await firestoreMethods.addProductToCart(event.productModel);
      if (result == 'Added to cart') {
        emit(
          ProductUploadedToDatabase(),
        );
      } else {
        print(result);
      }
    });
    on<DeleteProductFromCart>((event, emit) async {
      emit(AddToCartLoading());
      final result = await firestoreMethods.deleteProductFromCart(event.uid);
      emit(AddToCartLoaded());
    });
  }
}
