import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/screens/account/account_screen.dart';
import 'package:petstore/screens/home/brands/brands.dart';
import 'package:petstore/screens/home/category/items/itemsdetail/detail%20component/detail_coursel_slider.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/sharepreferrence.dart';
import 'package:petstore/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../../../../../../utils/app_text_button.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<SharedPref>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var weightandSize = [
      '2kg',
      '10kg',
      '10kg',
    ];
    var weightandSizeButton = [
      () {},
      () {},
      () {},
    ];

    return Scaffold(
      body: Container(
        height: 72 * SizeConfig.heightMultiplier,
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                CarouselWithDotsPage(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.060),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: appText(
                            text: 'Zoomax Birdy Plunk Foraging Bird toy'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          appText(text: 'By'),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ShopByBrands.routeName);
                              },
                              child: appText(
                                  text: 'Zoo Max', color: AppColor.greenText)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      appText(
                          text: 'Size',
                          color: Colors.black45,
                          fontweight: FontWeight.w400),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: weightandSize.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: weightandSizeButton[index],
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.lightgrey,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 0.5, color: Colors.black54)),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.010),
                                  child: appText(
                                      text: weightandSize[index],
                                      textAlignment: TextAlign.center),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: 20),
                      appText(
                          text: 'Quantity',
                          color: Colors.black45,
                          fontweight: FontWeight.w400),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: width,
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.050),
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(index + 1);
                          },
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.010),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColor.lightgrey,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5, color: Colors.black54)),
                            height: 40,
                            width: 100,
                            child: appText(
                                text: index + 1,
                                textAlignment: TextAlign.center),
                          ),
                        );
                      }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.060, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.lightgrey,
                  ),
                  alignment: Alignment.center,
                  height: 200,
                  width: width,
                  child: appText(text: 'AED 165.0'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: width * 0.060),
                  child: appText(
                      text: 'text',
                      textAlignment: TextAlign.left,
                      maxlines: 1000),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  width: width,
                  color: AppColor.lightgrey,
                  child: AppTextButton.appTextButton(
                      onTap: () {
                        if (pref.user == null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) =>
                                  AccountScreen(selectedPage: 0))));
                        } else {
                          print('user Loged in');
                        }
                      },
                      height: 80,
                      width: width,
                      textAlignment: Alignment.center,
                      text: 'Add to Cart',
                      textFontWeight: FontWeight.w600,
                      textColor: Colors.white,
                      buttonColor: AppColor.secondarycolor,
                      radius: 10,
                      textFontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
