import 'package:flutter/material.dart';
import 'package:shopit/utils/color_themes.dart';

import '../utils/constants.dart';

class addressWidget extends StatefulWidget {
  bool isSelected;
  addressWidget({
    Key? key,
    required this.screenSize,
    required this.address,
    this.isSelected = false,
  }) : super(key: key);

  final Size screenSize;
  var address;

  @override
  State<addressWidget> createState() => _addressWidgetState();
}

class _addressWidgetState extends State<addressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: widget.screenSize.height * 0.15,
      width: widget.screenSize.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.isSelected ? buttonColor : Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Primary Address-',
            style: productNameStyle.copyWith(
              fontSize: 18,
            ),
          ),
          Center(
            child: Text(
              widget.address.name,
              style: addressTextStyle.copyWith(
                fontSize: 15,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: widget.screenSize.height * 0.01,
          ),
          Center(
            child: Text(
              widget.address.address,
              style: addressTextStyle.copyWith(
                fontSize: 15,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
