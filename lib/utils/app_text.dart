import 'package:flutter/material.dart';

import 'colors.dart';

Widget appText(
    {@required text,
    textAlignment = TextAlign.center,
    color = AppColor.darkText,
    double fontsize = 18.0,
    feildOverFlow = TextOverflow.ellipsis,
    maxlines,
    FontWeight fontweight = FontWeight.w600,
    double height = 1}) {
  return Text(
    text.toString(),
    textAlign: textAlignment,
    overflow: feildOverFlow,
    maxLines: maxlines ?? null,
    style: TextStyle(
      color: color,
      fontSize: fontsize,
      height: height,
      fontWeight: fontweight,
    ),
  );
}

Widget pageTitle({
  @required text,
  textAlignment = TextAlign.center,
  color = AppColor.white,
  double fontsize = 18.0,
  feildOverFlow = TextOverflow.ellipsis,
  maxlines,
  FontWeight fontweight = FontWeight.w600,
}) {
  return Text(
    text.toString(),
    textAlign: textAlignment,
    overflow: feildOverFlow,
    maxLines: maxlines ?? null,
    style: TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: fontweight,
    ),
  );
}

Widget customText(
    {TextAlign alignment = TextAlign.start,
    required String title,
    double letterspace = 0.0,
    Color color = Colors.black,
    double size = 15,
    double height = 1.2,
    TextOverflow overflow = TextOverflow.visible,
    FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    title,
    textAlign: alignment,
    style: TextStyle(
      fontFamily: 'Avenir',
      overflow: overflow,
      color: color,
      letterSpacing: letterspace,
      fontWeight: fontWeight,
      height: height,
      fontSize: size,
    ),
  );
}