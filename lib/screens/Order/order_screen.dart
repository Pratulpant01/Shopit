// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import 'package:shopit/blocs/UserDataBloc/firestore_bloc.dart';
import 'package:shopit/models/address_model.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/screens/Order/services/order_services.dart';
import 'package:shopit/screens/Order/services/order_services.dart';
import 'package:shopit/screens/account_screen.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';
import 'package:shopit/widgets/Buttons/primary_button.dart';
import 'package:shopit/widgets/parent_appBar_widget.dart';
import 'package:shopit/widgets/user_details_bar.dart';

import '../../widgets/address_widget.dart';
import '../../widgets/textfield_widget.dart';

final _addressFormKey = GlobalKey<FormState>();

class OrderScreen extends StatefulWidget {
  final String totalAmount;
  bool isSelected;
  OrderScreen({
    Key? key,
    required this.totalAmount,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String addressDetails = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentItems.add(
      PaymentItem(
          amount: widget.totalAmount,
          label: 'Total Amount',
          status: PaymentItemStatus.final_price),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    cityController.dispose();
    addressController.dispose();
    pinCodeController.dispose();
    super.dispose();
  }

  List<PaymentItem> paymentItems = [];
  void onApplePayResult(res) async {
    if (BlocProvider.of<FirestoreBloc>(context).state.userData.address ==
        null) {
      OrderServices().uploadUserAddress(
        AddressModel(address: addressDetails),
      );
    }
    final products = await OrderServices().getOrderedProducts();
    OrderServices().uploadOrderToDatabse(
      products: products,
      totalPrice: widget.totalAmount,
      shippingAddress: addressDetails,
      buyerId: FirebaseAuth.instance.currentUser!.uid,
      orderStatus: 0,
    );
  }

  void onGooglePayResult(res) async {
    if (BlocProvider.of<FirestoreBloc>(context).state.userData.address ==
        null) {
      OrderServices().uploadUserAddress(
        AddressModel(address: addressDetails),
      );
    }
    final products = await OrderServices().getOrderedProducts();
    OrderServices().uploadOrderToDatabse(
      products: products,
      totalPrice: widget.totalAmount,
      shippingAddress: addressDetails,
      buyerId: FirebaseAuth.instance.currentUser!.uid,
      orderStatus: 0,
    );
  }

  void addressSelected(String defaultAddress) {
    addressDetails = '';
    bool isFromActive = nameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        pinCodeController.text.isNotEmpty;

    if (isFromActive) {
      if (_addressFormKey.currentState!.validate()) {
        addressDetails =
            '${nameController.text}, ${phoneNumberController.text} \n${addressController.text}, ${cityController.text}, ${pinCodeController.text}';
      } else {
        throw Exception('Please enter all the required fields');
      }
    } else if (defaultAddress.isNotEmpty) {
      addressDetails = defaultAddress;
    } else {
      throw Exception('Error');
    }
    print(addressDetails);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    var user = BlocProvider.of<FirestoreBloc>(context).state.userData;

    return Scaffold(
        appBar: ParentAppBarWidget(
          hasBack: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  user != null
                      ? Column(
                          children: [
                            addressWidget(
                              screenSize: screenSize,
                              address: user,
                            ),
                            Center(
                              child: Text("Or", style: addressTextStyle),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  Center(
                    child: Text(
                      'Add your address',
                      style: addressTextStyle,
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: !widget.isSelected ? buttonColor : Colors.grey,
                  ),
                  Form(
                    key: _addressFormKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                          title: "Name",
                          controller: nameController,
                          obsecureText: false,
                          hintText: 'Full Name',
                        ),
                        TextFieldWidget(
                          title: "Address",
                          controller: addressController,
                          obsecureText: false,
                          hintText: 'Flat, House No, Building',
                        ),
                        TextFieldWidget(
                          title: "City",
                          controller: cityController,
                          obsecureText: false,
                          hintText: 'City',
                        ),
                        TextFieldWidget(
                          title: "Pin Code",
                          controller: pinCodeController,
                          obsecureText: false,
                          hintText: 'Pin code',
                        ),
                        TextFieldWidget(
                          title: "Phone Number",
                          controller: phoneNumberController,
                          obsecureText: false,
                          hintText: 'Enter your phone number',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .05,
                  ),
                  // ElevatedButton(
                  //     onPressed: () async {
                  //       addressSelected(user.address);
                  //       List<ProductModel> products =
                  //           await OrderServices().getOrderedProducts();
                  //       await OrderServices().uploadOrderToDatabse(
                  //         products: products,
                  //         totalPrice: widget.totalAmount,
                  //         shippingAddress: addressDetails,
                  //         buyerId: FirebaseAuth.instance.currentUser!.uid,
                  //         orderStatus: 0,
                  //       );
                  //     },
                  //     child: Text('Testing')),
                  ApplePayButton(
                    onPressed: () => addressSelected(user.address),
                    width: screenSize.width,
                    height: screenSize.height * 0.05,
                    type: ApplePayButtonType.buy,
                    style: ApplePayButtonStyle.whiteOutline,
                    paymentConfigurationAsset: 'applepay.json',
                    onPaymentResult: onApplePayResult,
                    paymentItems: paymentItems,
                  ),
                  SizedBox(
                    height: screenSize.height * .05,
                  ),
                  GooglePayButton(
                    onPressed: () => addressSelected(user.address),
                    width: screenSize.width,
                    height: screenSize.height * 0.05,
                    type: GooglePayButtonType.buy,
                    style: GooglePayButtonStyle.black,
                    paymentConfigurationAsset: 'gpay.json',
                    onPaymentResult: onGooglePayResult,
                    paymentItems: paymentItems,
                    loadingIndicator: Center(
                        child: CircularProgressIndicator(
                      color: buttonColor,
                    )),
                  )
                ]),
          ),
        ));
  }
}
