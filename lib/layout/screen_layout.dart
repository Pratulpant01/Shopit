import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopit/utils/color_themes.dart';

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
          children: [
            Center(
              child: Text('This is Home Screen'),
            ),
            Center(
              child: Text('This is Cart Screen'),
            ),
            Center(
              child: Text('This is Account Screen'),
            ),
            Center(
              child: Text('This is Profile Screen'),
            ),
          ],
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
                    color: activeCyanColor,
                    width: 2,
                  ),
                ),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              onTap: changePage,
              tabs: [
                Tab(
                  child: Icon(
                    Icons.home_outlined,
                    color: currentPage == 0 ? activeCyanColor : buttonColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: currentPage == 1 ? activeCyanColor : buttonColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: currentPage == 2 ? activeCyanColor : buttonColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.menu,
                    color: currentPage == 3 ? activeCyanColor : buttonColor,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
