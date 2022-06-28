// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopit/blocs/UserDataBloc/firestore_bloc.dart';

import 'package:shopit/models/userdetail_model.dart';
import 'package:shopit/utils/color_themes.dart';
import 'package:shopit/utils/constants.dart';
import 'package:shopit/utils/utils.dart';

class UserDetailsBar extends StatelessWidget {
  final double offset;

  const UserDetailsBar({
    Key? key,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Positioned(
      top: -offset / 5,
      child: Container(
        height: kAppBarHeight / 2,
        width: screenSize.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: lightBackgroundaGradient,
            begin: Alignment.centerLeft,
            end: Alignment.center,
          ),
        ),
        child: BlocBuilder<FirestoreBloc, FirestoreState>(
          builder: (context, state) {
            if (state is FirestoreLoading) {
              return Center(
                child: LinearProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (state is FirestoreLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 20,
                ),
                child: Row(children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Deliver to ${state.userData.name} - ${state.userData.address}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.abel(
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
