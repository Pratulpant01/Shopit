import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopit/utils/utils.dart';
import 'package:shopit/widgets/banner_widget.dart';
import 'package:shopit/widgets/searchbar_widget.dart';

import '../widgets/categories_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: false,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            CategoriesView(),
            BannerAdWidget(),
          ]),
        ));
  }
}
