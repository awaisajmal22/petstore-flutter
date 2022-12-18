import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/app_text_button.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/customeAppBar.dart';
import 'package:petstore/utils/size_config.dart';

import '../../utils/badge.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cartScreen';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.lightgrey,
      appBar: customAppBar(
          context: context,
          title: 'Cart',
          actionButton: Container(),
          searchButton: Container()
          ),
      body: Container(
        height: 78.5 * SizeConfig.heightMultiplier,
        child: Stack(
          children: [
            ListView.builder(
              padding: EdgeInsets.only(bottom: 160),
                physics: BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.060, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    width: width * 0.80,
                    height: height * 0.30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: height * 0.15,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/Dashboard/placeholder.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          // color: Colors.red,
                          height: 30 * SizeConfig.heightMultiplier,
                          width: 55 * SizeConfig.widthMultiplier,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 40 * SizeConfig.widthMultiplier,
                                    child: appText(
                                        text:
                                            'adjfhjkjjkjjkjkjkjkjkjkjkjkjkjkkkjdssdfssddsdsdsds',
                                        maxlines: 3,
                                        textAlignment: TextAlign.left),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppColor.lightgrey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Icon(Icons.close),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                width: width * 55,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText(text: 'Price'),
                                        appText(text: 'AED 150.0'),
                                      ],
                                    ),
                                    Container(
                                      color: Colors.black54,
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      height: 1,
                                      width: width * 0.55,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText(text: 'weight'),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                              color: AppColor.lightgrey,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: appText(
                                              text: 'Default size of pic'),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      color: Colors.black54,
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      height: 1,
                                      width: width * 0.55,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText(text: 'weight'),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                              color: AppColor.lightgrey,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: appText(text: '1'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.060),
                  color: AppColor.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          appText(text: 'Subtotal'),
                          pageTitle(text: 'AED ${58.0}',color: Colors.green,fontsize: 30)
                        ],
                      ),
                      AppTextButton.appTextButton(
                        onTap: (){}, 
                        height: 60, 
                        width:width * 0.30, 
                        textAlignment: Alignment.center, 
                        text: 'Check Out', 
                        textFontWeight: FontWeight.w500, 
                        textColor: Colors.white, buttonColor: AppColor.secondarycolor, radius: 10, textFontSize: 20)
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
