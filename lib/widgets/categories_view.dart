import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';

import '../screens/result_screen.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      height: kAppBarHeight,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultScreen(query: categoriesList[index]),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      categoryLogos[index],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.005,
                  ),
                  Text(
                    categoriesList[index],
                    style: productShortLabelStyle,
                  )
                ]),
              ),
            );
          }),
    );
  }
}
