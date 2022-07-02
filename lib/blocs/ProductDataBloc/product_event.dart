// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {
  ProductModel? productModel;
  ProductEvent({
    this.productModel,
  });
}

class UploadProductEvent extends ProductEvent {
  Uint8List? image;
  String productName;
  String rawCost;
  int productDiscount;
  List<dynamic> productDescription;
  String sellerName;
  String sellerUid;
  String category;
  int quantity;
  BuildContext context;
  UploadProductEvent({
    required this.image,
    required this.productName,
    required this.rawCost,
    required this.productDiscount,
    required this.productDescription,
    required this.sellerName,
    required this.sellerUid,
    required this.context,
    required this.category,
    this.quantity = 0,
  });
}

class GetProductDataEvent extends ProductEvent {}
