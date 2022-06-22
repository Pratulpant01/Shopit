import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopit/blocs/AuthBloc/auth_bloc.dart';
import 'package:shopit/resources/auth_methods.dart';
import 'package:shopit/screens/signup_screen.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/utils.dart';
import 'package:shopit/widgets/primary_button.dart';
import 'package:shopit/widgets/textfield_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthMethods authMethods = AuthMethods();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
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
                children: [
                  Hero(
                    tag: 1,
                    child: Image.asset(
                      'assets/shopit.png',
                      height: screenSize.height * 0.09,
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.5,
                    width: screenSize.width * 0.8,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Sign in',
                          style: GoogleFonts.aleo(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
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
                            child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return PrimaryButton(
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  color: buttonColor,
                                  isLoading:
                                      state is AuthLoading ? true : false,
                                  onPressed: () async {
                                    context.read<AuthBloc>().add(
                                          SigninUserEvent(
                                            password: passwordController.text,
                                            email: emailController.text,
                                            context: context,
                                          ),
                                        );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: buttonColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          'New to Shop It?',
                          style: GoogleFonts.acme(
                            color: buttonColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: buttonColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  PrimaryButton(
                    child: Text(
                      'Create new account',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: buttonColor,
                      ),
                    ),
                    color: Colors.grey[200]!,
                    isLoading: false,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
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



                                // setState(() {
                                //   isLoading = true;
                                // });
                                // String output = await authMethods.signInUser(
                                //   email: emailController.text,
                                //   password: passwordController.text,
                                // );
                                // if (output == 'Login Successful') {
                                //   Utils().showsnackBar(
                                //     context: context,
                                //     message: output,
                                //   );
                                // } else {
                                //   Utils().showsnackBar(
                                //     context: context,
                                //     message: output,
                                //   );
                                // }
                                // setState(() {
                                //   isLoading = false;
                                // });