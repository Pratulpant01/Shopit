import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/blocs/AddToCart/add_to_cart_bloc.dart';
import 'package:shopit/blocs/AuthBloc/auth_bloc.dart';
import 'package:shopit/blocs/ProductDataBloc/product_bloc.dart';
import 'package:shopit/blocs/UserDataBloc/firestore_bloc.dart';
import 'package:shopit/layout/screen_layout.dart';
import 'package:shopit/resources/auth_methods.dart';
import 'package:shopit/resources/firestore_methods.dart';
import 'package:shopit/screens/Product/services/product_services.dart';
import 'package:shopit/screens/add_to_cart/services/add_to_cart_services.dart';
import 'package:shopit/screens/signin_screen.dart';
import 'package:shopit/utils/color_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthMethods(),
        ),
        RepositoryProvider(
          create: (context) => ProductServices(),
        ),
        RepositoryProvider(
          create: (context) => FirestoreMethods(),
        ),
        RepositoryProvider(
          create: (context) => AddToCartServices(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              RepositoryProvider.of<AuthMethods>(context),
            ),
          ),
          BlocProvider(
            create: (context) =>
                FirestoreBloc(RepositoryProvider.of<FirestoreMethods>(context))
                  ..add(getUserEvent()),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
              RepositoryProvider.of<ProductServices>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AddToCartBloc(
              RepositoryProvider.of<AddToCartServices>(context),
            ),
          )
        ],
        child: MaterialApp(
          title: 'Shop it',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: backgroundColor1,
          ),
          // To check whether user is logged in or not. If not than it will show the login screen to the user. If yes than user will get the homepage.

          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, AsyncSnapshot<User?> user) {
                if (user.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: buttonColor,
                    ),
                  );
                } else if (user.hasData) {
                  return ScreenLayout();
                } else {
                  return SigninScreen();
                }
              }),
        ),
      ),
    );
  }
}
