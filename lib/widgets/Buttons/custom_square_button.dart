// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopit/utils/color_themes.dart';

import '../../utils/utils.dart';

class CustomSquareButton extends StatelessWidget {
  final Widget widget;
  final Color color;
  final VoidCallback onPressed;
  final double dimension;

  const CustomSquareButton({
    Key? key,
    required this.widget,
    required this.color,
    required this.onPressed,
    required this.dimension,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: dimension,
        width: dimension,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: buttonColor,
            width: 1,
          ),
        ),
        child: Center(child: widget),
      ),
    );
  }
}
