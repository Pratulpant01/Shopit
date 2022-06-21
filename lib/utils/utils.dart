import 'package:flutter/material.dart';

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }

  showsnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[200],
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
