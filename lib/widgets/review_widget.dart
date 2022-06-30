// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopit/models/review_model.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/widgets/rating_star_widget.dart';

import '../utils/utils.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel reviewModel;
  const ReviewWidget({
    Key? key,
    required this.reviewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    SizedBox sizedB = SizedBox(
      height: screenSize.width * .03,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reviewModel.senderName,
              style: descriptionStyle,
            ),
            Row(
              children: [
                RatingStarWidget(
                  rating: reviewModel.userRating,
                ),
                SizedBox(
                  width: screenSize.width * .02,
                ),
                Text(
                  keysOfRating[reviewModel.userRating - 1],
                  style: productShortLabelStyle,
                )
              ],
            ),
            Text(
              reviewModel.description,
              style: productNameStyle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
