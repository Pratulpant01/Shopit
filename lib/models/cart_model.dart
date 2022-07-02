// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  final String productName;
  final String imgUrl;
  final double price;
  final int discount;
  final List<dynamic> description;
  final String uid;
  final String category;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int numberOfRating;
  final int quantity;
  CartModel({
    required this.productName,
    required this.imgUrl,
    required this.price,
    required this.discount,
    required this.description,
    required this.uid,
    required this.category,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.numberOfRating,
    required this.quantity,
  });
}
