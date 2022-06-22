import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  changePage(int page) {
    pageController.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                    currentPage == 0 ? Icons.home : Icons.home_outlined,
                    color: currentPage == 0 ? buttonColor : buttonColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    currentPage == 1
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                    color: currentPage == 1 ? buttonColor : buttonColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    currentPage == 2
                        ? Icons.account_circle
                        : Icons.account_circle_outlined,
                    color: currentPage == 2 ? buttonColor : buttonColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    currentPage == 3 ? Icons.menu_outlined : Icons.menu,
                    color: currentPage == 3 ? buttonColor : buttonColor,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
