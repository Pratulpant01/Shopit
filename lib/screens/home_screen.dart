import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopit/models/userdetail_model.dart';
import 'package:shopit/resources/firestore_methods.dart';
import 'package:shopit/screens/search_screen.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';
import 'package:shopit/widgets/banner_widget.dart';
import 'package:shopit/widgets/bubble_icon_widget.dart';
import 'package:shopit/widgets/parent_appBar_widget.dart';
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
    Size screenSize = Utils().getScreenSize();

    return Scaffold(
        appBar: ParentAppBarWidget(
          hasBack: false,
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
                        children: Demoproducts,
                      ),
                      ProductsShowCase(
                        title: '50% Off Sale',
                        children: Demoproducts,
                      ),
                      ProductsShowCase(
                        title: '20% Off Sale',
                        children: Demoproducts,
                      )
                    ]),
                  ),
                  UserDetailsBar(
                    offset: offset,
                    userDetailModel: UserDetailModel(
                      address: userData['address'],
                      name: userData['name'],
                    ),
                  )
                ],
              ));
  }
}
