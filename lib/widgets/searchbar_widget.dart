// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shopit/layout/screen_layout.dart';
import 'package:shopit/screens/cart_screen.dart';
import 'package:shopit/screens/result_screen.dart';
import 'package:shopit/screens/search_screen.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';

import '../utils/utils.dart';
import 'bubble_icon_widget.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  ScreenLayout screenLayout = ScreenLayout();

  SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  })  : preferredSize = Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  // TODO: implement preferredSize
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Container(
      height: kAppBarHeight * 1.5,
      decoration: BoxDecoration(),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hasBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: screenSize.height * 0.035,
                    ))
                : Container(),
            SizedBox(
              width: screenSize.width * 0.68,
              child: TextField(
                onSubmitted: (String query) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(query: query),
                    ),
                  );
                },
                readOnly: isReadOnly,
                onTap: () {
                  if (isReadOnly) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  border: border,
                  focusedBorder: border,
                  hintText: 'Search for products',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            isReadOnly
                ? bubbleIcon(
                    iconName: Icon(
                      Icons.shopping_bag_outlined,
                      size: screenSize.height * 0.03,
                    ),
                    iconValue: '1',
                    onPress: () {},
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
