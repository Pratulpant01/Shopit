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

class UpdateCartEvent extends AddToCartEvent {
  ProductModel productModel;
  UpdateCartEvent({
    required this.productModel,
  });
}
