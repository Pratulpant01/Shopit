// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductModel {
  final String productName;
  final String imgUrl;
  final double productPrice;
  final int productDiscount;
  final List productDescription;
  final String uid;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int numberOfRating;
  ProductModel({
    required this.productName,
    required this.imgUrl,
    required this.productPrice,
    required this.productDiscount,
    required this.productDescription,
    required this.uid,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.numberOfRating,
  });
}
