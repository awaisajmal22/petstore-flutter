import 'package:flutter/material.dart';
import 'package:petstore/utils/badge.dart';
import 'package:petstore/utils/colors.dart';

import '../screens/cart/cart_screen.dart';

AppBar CustomAppBarwithSearch(
    {required BuildContext context, required String? title}) {
  final width = MediaQuery.of(context).size.width;

  return AppBar(
    automaticallyImplyLeading: false,
    leading: title == 'Search for products' ? GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(Icons.navigate_before, color: Colors.white,size: 30),
    ) : null,
    backgroundColor: AppColor.green,
    elevation: 0,
    title: title == 'Search for products'
        ? Text(title!)
        : Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logos/logo.png'))),
          ),
    centerTitle: true,
    actions: [
      Badge(value: 2.toString(), color: Colors.red),
      SizedBox(
        width: width * 0.030,
      )
    ],
    bottom: PreferredSize(
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintText: "Search",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
          ),
        ),
        preferredSize: Size.fromHeight(100)),
  );
}
