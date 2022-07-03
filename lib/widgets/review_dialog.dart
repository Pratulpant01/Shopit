// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shopit/blocs/AuthBloc/auth_bloc.dart';
import 'package:shopit/blocs/UserDataBloc/firestore_bloc.dart';

import 'package:shopit/resources/firestore_methods.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';
import 'package:shopit/screens/Product/services/product_services.dart';

class ReviewDialog extends StatelessWidget {
  final String productUid;
  const ReviewDialog({
    Key? key,
    required this.productUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirestoreBloc, FirestoreState>(
      builder: (context, state) {
        if (state is FirestoreLoading) {
          return Container();
        }
        return RatingDialog(
          title: Text(
            'Type a review for this Product',
            textAlign: TextAlign.center,
            style: headingStyle.copyWith(fontSize: 20),
          ),
          submitButtonText: 'Send',
          submitButtonTextStyle: headingStyle.copyWith(color: buttonColor),
          commentHint: 'Type Here',
          onSubmitted: (RatingDialogResponse response) async {
            final result = await ProductServices().uploadReviewToDatabase(
              senderName: state.userData!.name,
              userRating: response.rating.toInt(),
              description: response.comment,
              productUid: productUid,
            );

            if (result == 'Review added sucessfully') {
              Utils().showsnackBar(
                context: context,
                message: result,
              );
            } else {
              Utils().showsnackBar(context: context, message: result);
            }
          },
        );
      },
    );
  }
}
