import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/widgets/cart_item_widget.dart';
import 'package:shopit/widgets/Buttons/primary_button.dart';
import 'package:shopit/widgets/parent_appBar_widget.dart';
import 'package:shopit/widgets/searchbar_widget.dart';
import 'package:shopit/widgets/user_details_bar.dart';

import '../models/userdetail_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ParentAppBarWidget(
        hasBack: false,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: kAppBarHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryButton(
                    child: Text(
                      'Proceed to buy n items',
                      style: buttonTitleStyle,
                    ),
                    color: lightbuttonColor,
                    isLoading: false,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                    child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('cart')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(color: buttonColor),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          ProductModel product = ProductModel.fromJson(
                              snapshot.data!.docs[index].data());
                          return CartItemWidget(
                            product: product,
                          );
                        });
                  },
                ))
              ],
            ),
          ),
          UserDetailsBar(
            offset: 0,
          ),
        ],
      ),
    );
  }
}


// ProductModel(
//                             productName:
//                                 'Samsung  1.5 Ton 3 Star Wi-Fi Twin-Cool Inverter Split Air Conditioner (Copper, Auto Convertible, Shield Blu Anti-Corrosion Technology, 2022 Model, CS/CU-SU18XKYTA, White)',
//                             imgUrl:
//                                 'https://m.media-amazon.com/images/I/31YVq3uH0EL._SL1024_.jpg',
//                             price: 16000,
//                             discount: 0,
//                             uid: '12',
//                             sellerName: 'Samsung',
//                             sellerUid: 'samsung',
//                             rating: 5,
//                             numberOfRating: 10,
//                             description: productDescriptionList,
//                             category: 'Electronics',
//                           ),