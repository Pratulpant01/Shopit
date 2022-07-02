import 'package:flutter/material.dart';

import '../utils/constants.dart';

class addressWidget extends StatelessWidget {
  addressWidget({
    Key? key,
    required this.screenSize,
    required this.address,
  }) : super(key: key);

  final Size screenSize;
  var address;

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
      height: screenSize.height * 0.15,
      width: screenSize.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
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
              address.name,
              style: addressTextStyle.copyWith(
                fontSize: 15,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
          Center(
            child: Text(
              address.address,
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
