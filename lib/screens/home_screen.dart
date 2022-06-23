import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopit/resources/firestore_methods.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';
import 'package:shopit/widgets/banner_widget.dart';
import 'package:shopit/widgets/product_show_list.dart';
import 'package:shopit/widgets/product_widget.dart';
import 'package:shopit/widgets/searchbar_widget.dart';
import 'package:shopit/widgets/user_details_bar.dart';

import '../widgets/categories_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userData = {};
  bool isLoading = false;
  double offset = 0;
  ScrollController controller = ScrollController();

  List<Widget> products = [
    ProductWidget(
        productName: 'Samsung Ac',
        url: 'https://m.media-amazon.com/images/I/31YVq3uH0EL._SL1024_.jpg'),
    ProductWidget(
        productName: 'Realme Narzo 6',
        url: 'https://m.media-amazon.com/images/I/7136zgtNmJL._SL1500_.jpg'),
    ProductWidget(
        productName: 'LG Fridge',
        url: 'https://m.media-amazon.com/images/I/71PjRr580lL._SL1500_.jpg'),
    ProductWidget(
        productName: 'Samsung Microwave',
        url: 'https://m.media-amazon.com/images/I/717Kju6Tu2L._SL1500_.jpg'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
    getUser();
  }

  getUser() async {
    isLoading = true;
    var userDetails = await FirestoreMethods().getUserDetails();
    userData = userDetails.data();
    setState(() {});
    isLoading = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: false,
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
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
                        children: products,
                      ),
                      ProductsShowCase(
                        title: '50% Off Sale',
                        children: products,
                      ),
                      ProductsShowCase(
                        title: '20% Off Sale',
                        children: products,
                      )
                    ]),
                  ),
                  UserDetailsBar(
                    offset: offset,
                    name: userData['name'],
                    address: userData['address'],
                  )
                ],
              ));
  }
}
