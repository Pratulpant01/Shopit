// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopit/resources/auth_methods.dart';
import 'package:shopit/screens/signin_screen.dart';

import 'package:shopit/utils/color_themes.dart';

import '../utils/utils.dart';
import '../utils/widgets/primary_button.dart';
import '../utils/widgets/text_button.dart';
import '../utils/widgets/textfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Size screenSize = Utils().getScreenSize();
  bool isLoading = false;

  AuthMethods authMethods = AuthMethods();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    super.dispose();

    // TODO: implement dispose
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 1,
                    child: Image.asset(
                      'assets/shopit.png',
                      height: screenSize.height * 0.09,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width * 0.9,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Sign Up',
                              style: GoogleFonts.aleo(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextFieldWidget(
                              title: "Name",
                              controller: nameController,
                              obsecureText: false,
                              hintText: 'Enter your name',
                            ),
                            TextFieldWidget(
                              title: "Address",
                              controller: addressController,
                              obsecureText: false,
                              hintText: 'Enter your address',
                            ),
                            TextFieldWidget(
                              title: "Email",
                              controller: emailController,
                              obsecureText: false,
                              hintText: 'Enter your email',
                            ),
                            TextFieldWidget(
                              title: "Password",
                              controller: passwordController,
                              obsecureText: true,
                              hintText: 'Enter your password',
                            ),
                            Center(
                              child: Hero(
                                tag: 2,
                                child: PrimaryButton(
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  color: buttonColor,
                                  isLoading: isLoading,
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    String output =
                                        await authMethods.signUpUser(
                                            name: nameController.text,
                                            address: addressController.text,
                                            email: emailController.text,
                                            password: passwordController.text);
                                    if (output == 'Registration Successful') {
                                      Utils().showsnackBar(
                                        context: context,
                                        message: output,
                                      );
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SigninScreen(),
                                        ),
                                      );
                                    } else {
                                      Utils().showsnackBar(
                                        context: context,
                                        message: output,
                                      );
                                    }
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                            textButton(
                              label: 'Already a customer? Login Now!',
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SigninScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
