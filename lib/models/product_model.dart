// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final int quantity;

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
    this.quantity = 0,
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
      quantity: json['quantity'],
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
      'quantity': quantity,
    };
  }

  Map<String, dynamic> getCartJson() {
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
      'quantity': quantity + 1,
    };
  }

  @override
  String toString() {
    return 'ProductModel(productName: $productName, imgUrl: $imgUrl, price: $price, discount: $discount, description: $description, uid: $uid, category: $category, sellerName: $sellerName, sellerUid: $sellerUid, rating: $rating, numberOfRating: $numberOfRating, quantity: $quantity)';
  }
}
