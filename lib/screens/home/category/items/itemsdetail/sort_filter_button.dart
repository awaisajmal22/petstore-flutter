import 'package:flutter/material.dart';
import 'package:petstore/utils/app_text_button.dart';
import 'package:petstore/utils/colors.dart';

class SortandFilter {
  static button({required Function()? onTapSort, required Function()? onTapFilter, required double width}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.060),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTapSort,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.greenText,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20)
                )
              ),
              height: 60,
              width: 200,
              child: Center(
                child: Text('Sort', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              ),
            ),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: onTapFilter,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.greenText,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              height: 60,
              width: 200,
              child: Center(
                child: Text('Filter', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
