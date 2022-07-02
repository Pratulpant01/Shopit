// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AddressModel {
  final String address;
  AddressModel({
    required this.address,
  });

  Map<String, dynamic> getJson() {
    return {
      'address': address,
    };
  }
}
