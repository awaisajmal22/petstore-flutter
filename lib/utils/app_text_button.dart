import 'package:flutter/material.dart';

class AppTextButton {
  static appTextButton(
    {
      required Function()? onTap,
      required double height,
       required double width,
       required Alignment textAlignment,
       required String? text,
       required FontWeight textFontWeight,
       required Color textColor,
       required Color buttonColor,
       required double radius,
       required double textFontSize,
       
    }
  ) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(radius)
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        child: Align(
          alignment: textAlignment,
          child: Text(
            text!,
          style: TextStyle(
            fontSize: textFontSize,
            fontWeight: textFontWeight,
            color: textColor,
          ),
          ),
        ),
      ),
    );
  }
}
