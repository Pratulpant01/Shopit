// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ReviewModel {
  final String senderName;
  final int userRating;
  final String description;
  ReviewModel({
    required this.senderName,
    required this.userRating,
    required this.description,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      senderName: json['senderName'],
      userRating: json['userRating'],
      description: json['description'],
    );
  }

  Map<String, dynamic> getJson() {
    return {
      'senderName': senderName,
      'userRating': userRating,
      'description': description,
    };
  }
}
