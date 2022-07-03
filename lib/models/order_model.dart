// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:shopit/models/product_model.dart';

class OrderModel {
  ProductModel? product;
  final String totalPrice;
  final String shippingAddress;
  final String buyerId;
  final orderedAt;
  final String orderNumber;
  final int orderStatus; // 0 = pending, 1= shipped, 2= received, 3= delivered

  OrderModel({
    this.product,
    required this.totalPrice,
    required this.shippingAddress,
    required this.buyerId,
    required this.orderedAt,
    this.orderStatus = 0,
    required this.orderNumber,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      shippingAddress: json['shippingAddress'],
      buyerId: json['buyerId'],
      orderedAt: (json['orderedAt'] as Timestamp).toDate(),
      orderNumber: json['orderNumber'],
    );
  }

  Map<String, dynamic> getJson() {
    return {
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress,
      'buyerId': buyerId,
      'orderedAt': orderedAt,
      'orderStatus': orderStatus,
      'orderNumber': orderNumber,
    };
  }

  @override
  String toString() {
    return 'OrderModel(product: $product, totalPrice: $totalPrice, shippingAddress: $shippingAddress, buyerId: $buyerId, orderNumber: $orderNumber, orderedAt: $orderedAt)';
  }
}
