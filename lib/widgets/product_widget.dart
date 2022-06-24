// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatelessWidget {
  final String url;
  final String productName;
  const ProductWidget({
    Key? key,
    required this.url,
    required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
            padding: EdgeInsets.all(
              10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    url,
                    fit: BoxFit.contain,
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: Text(
                    productName,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.akshar(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}