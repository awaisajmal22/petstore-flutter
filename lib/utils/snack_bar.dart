import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class Snackbar {
//   static snackBar({
//     required String error,
//     required BuildContext context,
//     required double height,
//     required Color color,
//   }) {
//     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(
//         error,
//         textAlign: TextAlign.center,
//       ),
//       behavior: SnackBarBehavior.fixed,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(24),
//       ),
//       backgroundColor: color,
//     ));
//   }


class Snackbar {
  static snackBar(
    {
       required String error,
    required BuildContext context,
    required double height,
    required Color color,

    }
  ) {
    return Fluttertoast.showToast(
      backgroundColor: color,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_LONG,
      msg: error
      );

  }
}
