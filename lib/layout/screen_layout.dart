// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';

class ScreenLayout extends StatefulWidget {
  int currentPage;
  ScreenLayout({
    Key? key,
    this.currentPage = 0,
  }) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  changePage(int page) {
    print(widget.currentPage);
    pageController.jumpToPage(page);
    setState(() {
      widget.currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: widget.currentPage,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: tabScreens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Colors.grey[400]!,
            width: 1,
          ))),
          child: TabBar(
              indicator: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: buttonColor,
                    width: 2,
                  ),
                ),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              onTap: changePage,
              tabs: [
                Tab(
                  child: Icon(
                    widget.currentPage == 0 ? Icons.home : Icons.home_outlined,
                    color: widget.currentPage == 0 ? buttonColor : buttonColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    widget.currentPage == 1
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                    color: widget.currentPage == 1 ? buttonColor : buttonColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    widget.currentPage == 2
                        ? Icons.account_circle
                        : Icons.account_circle_outlined,
                    color: widget.currentPage == 2 ? buttonColor : buttonColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    widget.currentPage == 3 ? Icons.menu_outlined : Icons.menu,
                    color: widget.currentPage == 3 ? buttonColor : buttonColor,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
