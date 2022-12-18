
import 'package:flutter/material.dart';
import 'package:petstore/utils/app_text_button.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/size_config.dart';

class SortandFilter {
  static button({required Function()? onTapSort, required Function()? onTapFilter, required double width}) {
    return Container(
      width: width,
      alignment: Alignment.center,
      // margin: EdgeInsets.symmetric(horizontal: width * 0.060),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTapSort,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.greenText,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10)
                )
              ),
              height: 50,
              width: 40 * SizeConfig.widthMultiplier,
              child: Center(
                child: Text('Sort', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              ),
            ),
          ),
          SizedBox(width: 5,),
          GestureDetector(
            onTap: onTapFilter,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.greenText,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10)
                )
              ),
              height: 50,
              width: 40 * SizeConfig.widthMultiplier,
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
