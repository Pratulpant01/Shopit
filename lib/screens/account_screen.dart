import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/widgets/account_screen_appBar.dart';
import 'package:shopit/widgets/primary_button.dart';
import 'package:shopit/widgets/product_show_list.dart';

import '../utils/utils.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(children: [
            user_intro_widget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                child: Text('Sign Out'),
                color: buttonColor,
                isLoading: false,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                child: Text('Sell'),
                color: lightbuttonColor,
                isLoading: false,
                onPressed: () {},
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductsShowCase(
                title: 'Your Orders',
                children: Demoproducts,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Order Request',
                  style: GoogleFonts.acme(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          'Order ${index}: Realme Narzo 6',
                          style: GoogleFonts.actor(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text('Address- Deopa Building, near chungi'),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        ),
                      );
                    }))
          ]),
        ),
      ),
    );
  }
}

class user_intro_widget extends StatelessWidget {
  const user_intro_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.0000000000001),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hello, ',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 26,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                        text: 'Rahul',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1655949595981-f1d8e8739cdf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2802&q=80',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
