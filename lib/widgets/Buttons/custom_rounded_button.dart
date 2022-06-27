// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';

class CustomRoundedButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const CustomRoundedButton({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(3),
          color: color,
        ),
        child: Text(
          buttonTitle,
          style: buttonTitleStyle.copyWith(
            fontWeight: FontWeight.w300,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
