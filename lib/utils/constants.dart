import 'package:flutter/material.dart';
import 'package:shopit/screens/account_screen.dart';
import 'package:shopit/screens/cart_screen.dart';
import 'package:shopit/screens/home_screen.dart';

import '../widgets/product_widget.dart';

const double kAppBarHeight = 80;

const List<Widget> tabScreens = [
  HomeScreen(),
  CartScreen(),
  AccountScreen(),
  Center(
    child: Text('This is Profile Screen'),
  ),
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
