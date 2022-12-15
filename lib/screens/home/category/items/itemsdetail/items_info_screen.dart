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
      body: Stack(
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
                      height: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/Dashboard/placeholder.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                appText(
                                    text:
                                        'Good boy mega chicken carrot natural dog threats',
                                    textAlignment: TextAlign.left,
                                    maxlines: 2),
                                appText(
                                    text: 'AED 30.5',
                                    textAlignment: TextAlign.left,
                                    color: Colors.yellow),
                                appText(
                                    text: 'Free Delivery over AED 100',
                                    textAlignment: TextAlign.left,
                                    fontweight: FontWeight.w400,
                                    fontsize: 16),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.15),
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
            bottom: 10 * SizeConfig.heightMultiplier,
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
              right: width * 0.050,
              bottom: 18 * SizeConfig.heightMultiplier,
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
    );
  }
}
