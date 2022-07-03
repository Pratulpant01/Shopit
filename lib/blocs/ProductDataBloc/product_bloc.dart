import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/resources/firestore_methods.dart';
import 'package:shopit/screens/Product/services/product_services.dart';

import '../../utils/utils.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductServices productServices;
  ProductBloc(this.productServices) : super(ProductLoading()) {
    on<UploadProductEvent>(
      (event, emit) async {
        emit(ProductLoading());
        final result = await productServices.uploadProductToDatabse(
          image: event.image,
          productName: event.productName,
          rawCost: event.rawCost,
          productDiscount: event.productDiscount,
          productDescription: event.productDescription,
          sellerName: event.sellerName,
          sellerUid: event.sellerUid,
          category: event.category,
          quantity: event.quantity,
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
        emit(ProductUploaded());
      },
    );
    on<GetProductDataEvent>((event, emit) async {
      emit(ProductLoading());
      List<Widget> data = await productServices.getProductData();
      emit(
        ProductLoaded(productData: data),
      );
    });
  }
}
