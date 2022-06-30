// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopit/blocs/ProductDataBloc/product_bloc.dart';
import 'package:shopit/blocs/UserDataBloc/firestore_bloc.dart';
import 'package:shopit/resources/firestore_methods.dart';
import 'package:shopit/utils/color_themes.dart';
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

    return BlocProvider(
      create: (context) => ProductBloc(
        RepositoryProvider.of<FirestoreMethods>(context),
      )..add(GetProductDataEvent()),
      child: Scaffold(
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
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return Center(
                        child: CircularProgressIndicator(color: buttonColor),
                      );
                    }
                    return ProductsShowCase(
                      title: 'Latest Products',
                      children: state.productData!,
                    );
                  },
                ),
                showProductswithDiscountWidget(
                  discount: 50,
                  title: '50% Off Sale',
                ),
                showProductswithDiscountWidget(
                  discount: 60,
                  title: '60% Off Sale',
                ),
                showProductswithDiscountWidget(
                  discount: 70,
                  title: 'Shopit Bumper Sale',
                ),
              ]),
            ),
            UserDetailsBar(
              offset: offset,
            )
          ],
        ),
      ),
    );
  }
}

class showProductswithDiscountWidget extends StatelessWidget {
  final int discount;
  final String title;
  const showProductswithDiscountWidget({
    Key? key,
    required this.discount,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreMethods().getProductDataFromDiscount(discount),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(color: buttonColor),
            );
          }
          return ProductsShowCase(
            title: title,
            children: snapshot.data!,
          );
        });
  }
}
