// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CostWidget extends StatelessWidget {
  final Color color;
  final double cost;
  final double textSize;

  const CostWidget({
    Key? key,
    required this.color,
    required this.cost,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '₹',
          style: TextStyle(
            fontSize: 10,
            color: color,
            fontFeatures: [
              FontFeature.superscripts(),
            ],
          ),
        ),
        Flexible(
          child: Text(
            cost.toString(),
            style: GoogleFonts.acme(
              fontSize: textSize,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
