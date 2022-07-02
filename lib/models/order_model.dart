// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopit/models/product_model.dart';

class OrderModel {
  var product;
  final String totalPrice;
  final String shippingAddress;
  final String buyerId;
  final DateTime orderedAt;
  final int orderStatus; // 0 = pending, 1= shipped, 2= received, 3= delivered

  OrderModel({
    required this.product,
    required this.totalPrice,
    required this.shippingAddress,
    required this.buyerId,
    required this.orderedAt,
    this.orderStatus = 0,
  });

  Map<String, dynamic> getJson() {
    return {
      'product': product,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress,
      'buyerId': buyerId,
      'orderedAt': orderedAt,
      'orderStatus': orderStatus,
    };
  }
}
