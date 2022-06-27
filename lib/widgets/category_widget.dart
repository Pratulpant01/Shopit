// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shopit/screens/result_screen.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';

class CategoryWidget extends StatelessWidget {
  final int index;
  const CategoryWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(query: categoriesList[index]),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                )
              ]),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  categoryLogos[index],
                ),
                SizedBox(
                  height: screenSize.width * 0.03,
                ),
                Text(
                  categoriesList[index],
                  style: productShortLabelStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
