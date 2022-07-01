// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/blocs/AddToCart/add_to_cart_bloc.dart';

import 'package:shopit/models/product_model.dart';
import 'package:shopit/models/review_model.dart';
import 'package:shopit/resources/firestore_methods.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';
import 'package:shopit/widgets/Buttons/custom_rounded_button.dart';
import 'package:shopit/widgets/Buttons/primary_button.dart';
import 'package:shopit/widgets/cost_widget.dart';
import 'package:shopit/widgets/parent_appBar_widget.dart';
import 'package:shopit/widgets/rating_star_widget.dart';
import 'package:shopit/widgets/review_dialog.dart';
import 'package:shopit/widgets/review_widget.dart';

import '../widgets/user_details_bar.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    SizedBox sizedBox = SizedBox(
      height: screenSize.width * .03,
    );
    return BlocProvider(
      create: (context) => AddToCartBloc(
        RepositoryProvider.of<FirestoreMethods>(context),
      ),
      child: Scaffold(
        appBar: ParentAppBarWidget(
          hasBack: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: kAppBarHeight / 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.productModel.sellerName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: productShortLabelStyle.copyWith(
                                    fontSize: 15,
                                    color: activeCyanColor,
                                  ),
                                ),
                                sizedBox,
                                Text(
                                  widget.productModel.productName,
                                  maxLines:
                                      widget.productModel.productName.length,
                                  overflow: TextOverflow.ellipsis,
                                  style: productNameStyle.copyWith(),
                                ),
                              ],
                            ),
                          ),
                          RatingStarWidget(
                            rating: widget.productModel.rating,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: screenSize.height * 0.4,
                      child: Image.network(
                        widget.productModel.imgUrl,
                      ),
                    ),
                    CostWidget(
                      color: priceColor,
                      cost: widget.productModel.price,
                      textSize: 24,
                    ),
                    SizedBox(
                      height: screenSize.width * .05,
                    ),
                    PrimaryButton(
                      child: Text('Buy Now'),
                      color: buttonColor,
                      isLoading: false,
                      onPressed: () {},
                    ),
                    sizedBox,
                    BlocConsumer<AddToCartBloc, AddToCartState>(
                      listener: (context, state) {
                        if (state is ProductUploadedToDatabase) {
                          Utils().showsnackBar(
                              context: context,
                              message: 'Product Added To Cart');
                        } else {
                          Utils().showsnackBar(
                              context: context,
                              message:
                                  'Something went wrong. Please try again later.');
                        }
                      },
                      builder: (context, state) {
                        return PrimaryButton(
                          child: Text('Add to Cart'),
                          color: lightbuttonColor,
                          isLoading: false,
                          onPressed: () async {
                            context.read<AddToCartBloc>().add(
                                  AddProductToDatabase(
                                      productModel: widget.productModel),
                                );
                          },
                        );
                      },
                    ),
                    Divider(),
                    sizedBox,
                    Text(
                      'About this item',
                      style: headingStyle,
                    ),
                    sizedBox,
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: widget.productModel.description.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\u2022 ${widget.productModel.description[index]}',
                                  style: headingStyle.copyWith(fontSize: 12),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                sizedBox,
                              ],
                            );
                          }),
                    ),
                    sizedBox,
                    CustomRoundedButton(
                      buttonTitle: 'Add a review for this product',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context1) => ReviewDialog(
                            productUid: widget.productModel.uid,
                          ),
                        );
                      },
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                    sizedBox,
                    SizedBox(
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('products')
                                .doc(widget.productModel.uid)
                                .collection('reviews')
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<
                                        QuerySnapshot<Map<String, dynamic>>>
                                    snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container();
                              } else {
                                return snapshot.data!.docs.length == 0
                                    ? Center(
                                        child: Text(
                                          'No reviews found for this product',
                                          style: headingStyle.copyWith(
                                            color: buttonColor,
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          ReviewModel reviewModel =
                                              ReviewModel.fromJson(
                                            snapshot.data!.docs[index].data(),
                                          );
                                          return ReviewWidget(
                                              reviewModel: reviewModel);
                                        });
                              }
                            }))
                  ],
                ),
              ),
            ),
            UserDetailsBar(
              offset: 0,
            ),
          ],
        ),
      ),
    );
  }
}
