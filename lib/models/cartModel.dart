// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopit/models/product_model.dart';

class CartModel {
  List<ProductModel> products = [];
  final String totalAmount;
  CartModel({
    required this.products,
    required this.totalAmount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      products: json['products'],
      totalAmount: json['totalAmount'],
    );
  }

  Map<String, dynamic> getJson() {
    return {
      'products': products,
      totalAmount: totalAmount,
    };
  }
}
