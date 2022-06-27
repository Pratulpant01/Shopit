import 'package:flutter/material.dart';

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

class ParentAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  ScreenLayout screenLayout = ScreenLayout();
  final bool hasBack;

  ParentAppBarWidget({
    Key? key,
    required this.hasBack,
  })  : preferredSize = Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  // TODO: implement preferredSize
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Container(
      height: kAppBarHeight * 1.4,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hasBack
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                  ),
            Container(
              height: screenSize.height * .05,
              child: Image.asset(
                'assets/shopit.png',
                fit: BoxFit.cover,
              ),
            ),
            bubbleIcon(
              iconName: Icon(
                Icons.shopping_bag_outlined,
                size: screenSize.height * 0.03,
              ),
              iconValue: '1',
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
