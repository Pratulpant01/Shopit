import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/resources/firestore_methods.dart';
import 'package:shopit/screens/add_to_cart/services/add_to_cart_services.dart';
part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartServices addToCartServices;
  AddToCartBloc(this.addToCartServices) : super(AddToCartLoading()) {
    on<AddProductToDatabase>((event, emit) async {
      String result =
          await addToCartServices.addProductToCart(event.productModel);
      if (result == 'Added to cart') {
        emit(
          ProductUploadedToDatabase(),
        );
      } else {
        print(result);
      }
    });

    on<DeleteProductFromCart>((event, emit) async {
      emit(AddToCartLoading());
      final result = await addToCartServices.deleteProductFromCart(event.uid);
      emit(AddToCartLoaded());
    });

    on<AddProductQuantityinCart>((event, emit) async {
      bool isAdded =
          await addToCartServices.checkProductinCart(event.productUid);
      if (isAdded) {
        addToCartServices.updateAddToCartProduct(event.productUid);
      } else if (!isAdded) {
        add(AddProductToDatabase(productModel: event.productModel));
      }
      emit(AddToCartLoaded());
    });

    on<RemoveProductQuantityinCart>((event, emit) async {
      emit(AddToCartLoading());
      int quantity =
          await AddToCartServices().getProductQuantity(event.productUid);

      if (quantity >= 1) {
        await addToCartServices.removeProductQuantity(
            event.productUid, quantity);
      } else {
        emit(AddToCartLoading());
        await AddToCartServices().deleteProductFromCart(event.productUid);
      }

      emit(AddToCartLoaded());
    });
  }
}
