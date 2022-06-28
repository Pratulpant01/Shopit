// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/widgets/result_widgets.dart';
import 'package:shopit/widgets/searchbar_widget.dart';

import '../models/product_model.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: false,
        hasBackButton: true,
      ),
      body: Align(
        alignment: Alignment.centerLeft,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Showing results for ',
                    style: buttonTitleStyle.copyWith(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: query,
                    style: buttonTitleStyle.copyWith(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  return ResultsWidget(
                    product: ProductModel(
                      productName:
                          'Samsung  1.5 Ton 3 Star Wi-Fi Twin-Cool Inverter Split Air Conditioner (Copper, Auto Convertible, Shield Blu Anti-Corrosion Technology, 2022 Model, CS/CU-SU18XKYTA, White)',
                      imgUrl:
                          'https://m.media-amazon.com/images/I/31YVq3uH0EL._SL1024_.jpg',
                      price: 16000,
                      discount: 0,
                      uid: '12',
                      sellerName: 'Samsung',
                      sellerUid: 'samsung',
                      rating: 3,
                      numberOfRating: 10,
                      description: productDescriptionList,
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
