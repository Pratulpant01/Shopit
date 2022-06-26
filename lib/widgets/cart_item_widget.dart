// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopit/models/product_model.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';
import 'package:shopit/widgets/Buttons/custom_rounded_button.dart';
import 'package:shopit/widgets/Buttons/custom_square_button.dart';
import 'package:shopit/widgets/product_information_widget.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      padding: EdgeInsets.all(20),
      height: screenSize.height / 2.5,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width / 3,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    product.imgUrl,
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.03,
              ),
              ProductInformationWidget(
                productName: product.productName,
                productCost: product.productPrice,
                sellerName: product.sellerName,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              CustomSquareButton(
                color: backgroundColor,
                widget: Icon(
                  Icons.remove,
                ),
                onPressed: () {},
                dimension: screenSize.height * 0.05,
              ),
              CustomSquareButton(
                color: Colors.white,
                widget: Text(
                  '0',
                  style: TextStyle(
                    color: activeCyanColor,
                  ),
                ),
                onPressed: () {},
                dimension: screenSize.height * 0.05,
              ),
              CustomSquareButton(
                color: backgroundColor,
                widget: Icon(
                  Icons.add,
                ),
                onPressed: () {},
                dimension: screenSize.height * 0.05,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CustomRoundedButton(buttonTitle: 'Delete', onPressed: () {}),
                  SizedBox(
                    width: screenSize.width * 0.02,
                  ),
                  CustomRoundedButton(
                      buttonTitle: 'Save for Later', onPressed: () {})
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Text(
                    'See more like this',
                    style: linkButtonStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}