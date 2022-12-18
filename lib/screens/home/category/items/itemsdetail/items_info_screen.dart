import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/screens/home/category/items/itemsdetail/sort_and_filter.dart';
import 'package:petstore/screens/home/category/items/itemsdetail/sort_filter_button.dart';
import 'package:petstore/screens/search_screen.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/customeAppBar.dart';
import 'package:petstore/utils/size_config.dart';

import '../../../../../utils/badge.dart';
import '../../../../cart/cart_screen.dart';
import 'item_complete_detail_screen.dart';

class ItemsInfoScreen extends StatelessWidget {
  ItemsInfoScreen({super.key});

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.lightgrey,
      appBar: customAppBar(
          context: context,
          title: 'title',
          actionButton: Badge(
              value: 2.toString(), color: Colors.red) ,
          searchButton: GestureDetector(
                  onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen()));

                  },
                  child: Icon(
                    Icons.search,
                    color: AppColor.white,
                    size: 30,
                  )),
          ),
      body: Container(
        width: width,
        height: 78.5 * SizeConfig.heightMultiplier,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ItemCompleteDetailScreen()));
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: 6,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.050),
                        width: width,
                        height: 30 * SizeConfig.heightMultiplier,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Dashboard/placeholder.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              width: 50 * SizeConfig.widthMultiplier,
                              height: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  appText(
                                      text:
                                          'Good boy mega chicken carrot natural dog threats',
                                      textAlignment: TextAlign.left,fontsize: 16,
                                      maxlines: 2),
                                  appText(
                                      text: 'AED 30.5',
                                      textAlignment: TextAlign.left,
                                      color: Colors.yellow),
                                  appText(
                                      text: 'Free Delivery over AED 100',
                                      textAlignment: TextAlign.left,
                                      fontweight: FontWeight.w400,
                                      fontsize: 14),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.5 * SizeConfig.widthMultiplier),
                        child: Divider(
                          color: Colors.black,
                          height: 2,
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 3 * SizeConfig.heightMultiplier,
              child: SortandFilter.button(
                  onTapSort: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Sort(
                              title: 'Sort',
                              done: () {},
                            )));
                  },
                  onTapFilter: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Sort(
                              title: 'Filter',
                              done: () {},
                            )));
                  },
                  width: width),
            ),
            Positioned(
                right: 3 * SizeConfig.widthMultiplier,
                bottom: 12 * SizeConfig.heightMultiplier,
                child: FloatingActionButton(
                  focusColor: AppColor.greenText,
                  backgroundColor: AppColor.greenText,
                  onPressed: () {
                    _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(seconds: 2),
                        curve: Curves.easeInOut);
                  },
                  child: Center(
                    child: Icon(Icons.arrow_downward_rounded),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
