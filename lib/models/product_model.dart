// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductModel {
  final String productName;
  final String imgUrl;
  final double price;
  final int discount;
  final List<dynamic> description;
  final String uid;
  final String category;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int numberOfRating;
  ProductModel({
    required this.productName,
    required this.imgUrl,
    required this.price,
    required this.discount,
    required this.description,
    required this.uid,
    required this.category,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.numberOfRating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      imgUrl: json['imageUrl'],
      price: json['price'],
      discount: json['discount'],
      description: json['description'],
      uid: json['productUid'],
      sellerName: json['sellerName'],
      sellerUid: json['sellerUid'],
      rating: json['rating'],
      numberOfRating: json['numberOfRating'],
      category: json['category'],
    );
  }

  Map<String, dynamic> getJson() {
    return {
      'productName': productName,
      'discount': discount,
      'imageUrl': imgUrl,
      'price': price,
      'description': description,
      'productUid': uid,
      'sellerName': sellerName,
      'sellerUid': sellerUid,
      'rating': rating,
      'numberOfRating': numberOfRating,
      'category': category,
    };
  }
}
