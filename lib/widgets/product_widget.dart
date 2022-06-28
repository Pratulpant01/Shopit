// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shopit/models/product_model.dart';
import 'package:shopit/screens/product_screen.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/widgets/cost_widget.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(
                productModel: productModel,
              ),
            ));
      },
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade100,
              width: 2,
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(
                10,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Image.network(
                      productModel.imgUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      productModel.productName,
                      textAlign: TextAlign.center,
                      style: productNameStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: CostWidget(
                        color: priceColor,
                        cost: productModel.price,
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
