// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopit/models/product_model.dart';
import 'package:shopit/resources/firestore_methods.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';
import 'package:shopit/widgets/Buttons/primary_button.dart';
import 'package:shopit/widgets/product_widget.dart';
import 'package:shopit/widgets/textfield_widget.dart';

class SellScreen extends StatefulWidget {
  SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List keysForDiscount = [0, 50, 60, 70];

  final bool isLoading = false;

  int selected = 1;

  ImagePicker imagePicker = ImagePicker();

  Uint8List? image;
  List<String> productDescription = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: screenSize.width / 2.5,
                          width: screenSize.width / 2.5,
                          child: Stack(
                            children: [
                              image == null
                                  ? Image.network(
                                      'https://www.glamox.com/public/images/image-default.png?scale=canvas&width=522&height=348&quality=80&f.sharpen=35',
                                      fit: BoxFit.cover,
                                    )
                                  : Image.memory(image!),
                              Positioned(
                                top: 50,
                                right: 0,
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: CircleAvatar(
                                    backgroundColor: buttonColor,
                                    child: IconButton(
                                      onPressed: () async {
                                        Uint8List temp =
                                            await Utils().pickImage();
                                        if (temp != null) {
                                          setState(() {
                                            image = temp;
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            margin: EdgeInsets.all(5),
                            height: screenSize.height * 0.7,
                            width: screenSize.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Enter your Product Details',
                                    style: buttonTitleStyle.copyWith(
                                      fontSize: 25,
                                      color: buttonColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.height * .02,
                                ),
                                TextFieldWidget(
                                  title: 'Name of a product',
                                  controller: productNameController,
                                  obsecureText: false,
                                  hintText: 'Enter your product name',
                                ),
                                TextFieldWidget(
                                  title: 'Price of a product',
                                  controller: priceController,
                                  obsecureText: false,
                                  hintText: 'Enter your product price',
                                ),
                                TextField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Click + Button to add item description',
                                    prefixIcon: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        productDescription
                                            .add(descriptionController.text);
                                        descriptionController.clear();
                                      },
                                    ),
                                    hintStyle: TextStyle(fontSize: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Discount',
                                  style: headingStyle,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    radioButtonWidget(
                                      selected: selected,
                                      title: 'None',
                                      buttonValue: 1,
                                      onChanged: (int? index) {
                                        setState(() {
                                          selected = index!;
                                        });
                                      },
                                    ),
                                    radioButtonWidget(
                                      selected: selected,
                                      title: '50%',
                                      buttonValue: 2,
                                      onChanged: (int? index) {
                                        setState(() {
                                          selected = index!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    radioButtonWidget(
                                      selected: selected,
                                      title: '60%',
                                      buttonValue: 3,
                                      onChanged: (int? index) {
                                        setState(() {
                                          selected = index!;
                                        });
                                      },
                                    ),
                                    radioButtonWidget(
                                      selected: selected,
                                      title: '70%',
                                      buttonValue: 4,
                                      onChanged: (int? index) {
                                        setState(() {
                                          selected = index!;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * .02,
                        ),
                        PrimaryButton(
                          child: Text('Sell', style: buttonTitleStyle),
                          color: buttonColor,
                          isLoading: false,
                          onPressed: () async {
                            String output =
                                await FirestoreMethods().uploadProductToDatabse(
                              image: image,
                              productName: productNameController.text,
                              rawCost: priceController.text,
                              productDiscount: keysForDiscount[selected - 1],
                              productDescription: productDescription,
                              sellerName:
                                  FirebaseAuth.instance.currentUser!.uid,
                              sellerUid: FirebaseAuth.instance.currentUser!.uid,
                            );
                            if (output == 'success') {
                              Utils().showsnackBar(
                                  context: context,
                                  message: 'Product added sucessfully');
                            } else {
                              Utils().showsnackBar(
                                  context: context, message: output);
                            }
                            productDescription.clear();
                          },
                        ),
                        SizedBox(
                          height: screenSize.height * .01,
                        ),
                        PrimaryButton(
                          child: Text('Back', style: buttonTitleStyle),
                          color: lightbuttonColor,
                          isLoading: false,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class radioButtonWidget extends StatelessWidget {
  final String title;
  final int buttonValue;
  final ValueChanged<int?> onChanged;
  const radioButtonWidget({
    Key? key,
    required this.title,
    required this.buttonValue,
    required this.onChanged,
    required this.selected,
  }) : super(key: key);

  final int selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(title),
        leading: Radio(
          value: buttonValue,
          groupValue: selected,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
