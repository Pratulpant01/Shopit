import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      title: Text(
        'Type a review for this Product',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      submitButtonText: 'Send',
      commentHint: 'Type Here',
      onSubmitted: (RatingDialogResponse response) {
        print(response.comment);
        print(response.rating);
      },
    );
  }
}
