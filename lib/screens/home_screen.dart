import 'package:flutter/material.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';
import 'package:shopit/widgets/banner_widget.dart';
import 'package:shopit/widgets/parent_appBar_widget.dart';
import 'package:shopit/widgets/product_show_list.dart';
import 'package:shopit/widgets/user_details_bar.dart';
import '../widgets/categories_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double offset = 0;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Scaffold(
        appBar: ParentAppBarWidget(
          hasBack: false,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Column(children: [
                SizedBox(
                  height: kAppBarHeight / 2,
                ),
                CategoriesView(),
                BannerAdWidget(),
                ProductsShowCase(
                  title: '70% Off Sale',
                  children: Demoproducts,
                ),
                ProductsShowCase(
                  title: '50% Off Sale',
                  children: Demoproducts,
                ),
                ProductsShowCase(
                  title: '20% Off Sale',
                  children: Demoproducts,
                ),
              ]),
            ),
            UserDetailsBar(
              offset: offset,
            )
          ],
        ));
  }
}
