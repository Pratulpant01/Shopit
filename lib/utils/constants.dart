import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopit/screens/account_screen.dart';
import 'package:shopit/screens/cart_screen.dart';
import 'package:shopit/screens/home_screen.dart';

import '../models/product_model.dart';
import '../screens/more_screen.dart';
import '../widgets/product_widget.dart';
import 'color_themes.dart';

const double kAppBarHeight = 80;

const List<Widget> tabScreens = [
  HomeScreen(),
  CartScreen(),
  AccountScreen(),
  MoreScreen(),
];

const List<String> categoriesList = [
  "Mobiles",
  "Fashion",
  "Electronics",
  "Appliances",
  "Books",
  "Essential"
];

const List<String> categoryLogos = [
  "assets/categories/mobile.png",
  "assets/categories/fashion.png",
  "assets/categories/electronics.png",
  "assets/categories/appliances.png",
  "assets/categories/books.png",
  "assets/categories/essential.png",
];

const List<String> largeAds = [
  "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61jmYNrfVoL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/612a5cTzBiL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61PzxXMH-0L._SX3000_.jpg",
];

const List<String> smallAds = [
  "https://m.media-amazon.com/images/I/11M5KkkmavL._SS70_.png",
  "https://m.media-amazon.com/images/I/11iTpTDy6TL._SS70_.png",
  "https://m.media-amazon.com/images/I/11dGLeeNRcL._SS70_.png",
  "https://m.media-amazon.com/images/I/11kOjZtNhnL._SS70_.png",
];

const List<String> adItemNames = [
  "Amazon Pay",
  "Recharge",
  "Rewards",
  "Pay Bills"
];

List<Widget> Demoproducts = [
  ProductWidget(
    productModel: ProductModel(
      productName:
          'Samsung  1.5 Ton 3 Star Wi-Fi Twin-Cool Inverter Split Air Conditioner (Copper, Auto Convertible, Shield Blu Anti-Corrosion Technology, 2022 Model, CS/CU-SU18XKYTA, White)',
      imgUrl: 'https://m.media-amazon.com/images/I/31YVq3uH0EL._SL1024_.jpg',
      productPrice: 16000,
      productDiscount: 0,
      uid: '12',
      sellerName: 'Samsung',
      sellerUid: 'samsung',
      rating: 5,
      numberOfRating: 10,
      productDescription: productDescriptionList,
    ),
  ),
  ProductWidget(
    productModel: ProductModel(
      productName:
          'Samsung  1.5 Ton 3 Star Wi-Fi Twin-Cool Inverter Split Air Conditioner (Copper, Auto Convertible, Shield Blu Anti-Corrosion Technology, 2022 Model, CS/CU-SU18XKYTA, White)',
      imgUrl: 'https://m.media-amazon.com/images/I/31YVq3uH0EL._SL1024_.jpg',
      productPrice: 16000,
      productDiscount: 0,
      uid: '12',
      sellerName: 'Samsung',
      sellerUid: 'samsung',
      rating: 3,
      numberOfRating: 10,
      productDescription: productDescriptionList,
    ),
  ),
  ProductWidget(
    productModel: ProductModel(
      productName:
          'Samsung  1.5 Ton 3 Star Wi-Fi Twin-Cool Inverter Split Air Conditioner (Copper, Auto Convertible, Shield Blu Anti-Corrosion Technology, 2022 Model, CS/CU-SU18XKYTA, White)',
      imgUrl: 'https://m.media-amazon.com/images/I/31YVq3uH0EL._SL1024_.jpg',
      productPrice: 16000,
      productDiscount: 0,
      uid: '12',
      sellerName: 'Samsung',
      sellerUid: 'samsung',
      rating: 1,
      numberOfRating: 10,
      productDescription: productDescriptionList,
    ),
  ),
  ProductWidget(
    productModel: ProductModel(
      productName:
          'Samsung  1.5 Ton 3 Star Wi-Fi Twin-Cool Inverter Split Air Conditioner (Copper, Auto Convertible, Shield Blu Anti-Corrosion Technology, 2022 Model, CS/CU-SU18XKYTA, White)',
      imgUrl: 'https://m.media-amazon.com/images/I/31YVq3uH0EL._SL1024_.jpg',
      productPrice: 16000,
      productDiscount: 0,
      uid: '12',
      sellerName: 'Samsung',
      sellerUid: 'samsung',
      rating: 2,
      numberOfRating: 10,
      productDescription: productDescriptionList,
    ),
  ),
];

List<String> keysOfRating = [
  'Very Bad',
  'Poor',
  'Average',
  'Good',
  'Excellent',
];

List<String> productDescriptionList = [
  'Split AC with inverter compressor: Variable speed compressor which adjusts power depending on heat load. It is most energy efficient and has lowest-noise operation',
  'Split AC: 1.5 ton Suitable for medium sized rooms (111 to 150 sq ft)',
  'Energy Rating: 5 Star | Annual Energy Consumption 806.28 Units per year | ISSER Value: 4.80 | Copper Condenser Coil: Better cooling and requires low maintenance.',
  'Warranty : 1 Year on Product, 10 Years on Compressor',
  '100% copper condenser with Durafin Ultra Coating : Better cooling and requires low maintenance',
  'Key Features: Noise Level Indoor Unit High/Low: 45/24 (db); Ambient Temperature: 52 degree Celsius',
  'Special Features: WindFree Cooling with 23,000 microholes, Freeze Wash, Dehumidification, Auto Clean (Self Cleaning), Easy Filter Plus (Anti-Bacteria), 4 Way Swing',
];

// Text Styles

TextStyle productNameStyle = GoogleFonts.akshar(
  fontSize: 17,
  fontWeight: FontWeight.bold,
);

TextStyle productShortLabelStyle = GoogleFonts.adventPro(
  color: buttonColor,
  fontWeight: FontWeight.bold,
);

TextStyle descriptionStyle = GoogleFonts.akayaTelivigala(
  color: buttonColor,
  fontWeight: FontWeight.bold,
);

TextStyle buttonTitleStyle = GoogleFonts.abel(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

TextStyle linkButtonStyle = GoogleFonts.actor(
  fontSize: 15,
  color: orangeColor,
  fontWeight: FontWeight.bold,
);

TextStyle headingStyle = GoogleFonts.aleo(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
