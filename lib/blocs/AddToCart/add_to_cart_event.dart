// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_to_cart_bloc.dart';

abstract class AddToCartEvent extends Equatable {
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}

class AddProductToDatabase extends AddToCartEvent {
  ProductModel productModel;
  AddProductToDatabase({
    required this.productModel,
  });
}

class DeleteProductFromCart extends AddToCartEvent {
  String uid;
  DeleteProductFromCart({
    required this.uid,
  });
}

class AddProductQuantityinCart extends AddToCartEvent {
  String productUid;
  ProductModel productModel;
  AddProductQuantityinCart({
    required this.productUid,
    required this.productModel,
  });
}

class RemoveProductQuantityinCart extends AddToCartEvent {
  String productUid;
  RemoveProductQuantityinCart({
    required this.productUid,
  });
}
