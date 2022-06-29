// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopit/models/product_model.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/widgets/cost_widget.dart';
import 'package:shopit/widgets/rating_star_widget.dart';

import '../utils/utils.dart';

class ResultsWidget extends StatelessWidget {
  final ProductModel product;
  const ResultsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          children: [
            SizedBox(
              width: screenSize.width / 3,
              child: Image.network(product.imgUrl),
            ),
            SizedBox(
              height: screenSize.width * .02,
            ),
            Text(
              product.productName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: productNameStyle,
            ),
            SizedBox(
              height: screenSize.width * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RatingStarWidget(rating: product.rating),
                Text(
                  '(${product.rating})',
                  style: TextStyle(
                    color: activeCyanColor,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenSize.width * .02,
            ),
            CostWidget(
              color: Colors.black,
              cost: product.price,
              textSize: 24,
            )
          ],
        ),
      ),
    );
  }
}
