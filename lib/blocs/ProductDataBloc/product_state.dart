// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  List<Widget>? productData;
  ProductState({
    this.productData,
  });

  @override
  List<Object> get props => [productData!];
}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductUploaded extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  ProductLoaded({required super.productData});

  @override
  List<Object> get props => [productData!];
}
