import 'package:flutter/material.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/widgets/category_widget.dart';
import 'package:shopit/widgets/parent_appBar_widget.dart';
import 'package:shopit/widgets/searchbar_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ParentAppBarWidget(
        hasBack: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: categoriesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.2 / 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return CategoryWidget(index: index);
            }),
      ),
    );
  }
}
