import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/colors.dart';

import '../screens/cart/cart_screen.dart';
import 'badge.dart';

AppBar customAppBar({
  required BuildContext context, 
  required String title, 
  required Widget actionButton,
  required Widget searchButton
}) {
  final width = MediaQuery.of(context).size.width;
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.greenAccent,
      statusBarBrightness: Brightness.dark
    ),
    bottom: PreferredSize(child: Container(), preferredSize: Size.fromHeight(10)),
    actions: [
      actionButton,
      SizedBox(width: width * 0.030,)
    ],
    leadingWidth: 100,
    elevation: 0,
    title: Column(
      children: [
        Text(title),
      ],
    ),
    centerTitle: true,
    backgroundColor: AppColor.green,
    automaticallyImplyLeading: false,
    leading: Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.030,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.navigate_before,
                    color: AppColor.white,
                    size: 30,
                  )),
                  SizedBox(width: 10,),
              searchButton
            ],
          ),
        ],
      ),
    ),
  );
}
