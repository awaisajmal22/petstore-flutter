import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/badge.dart';
import 'package:petstore/utils/colors.dart';

import 'detail component/detail.dart';

class ItemCompleteDetailScreen extends StatefulWidget {
  const ItemCompleteDetailScreen({super.key});

  @override
  State<ItemCompleteDetailScreen> createState() =>
      _ItemCompleteDetailScreenState();
}

class _ItemCompleteDetailScreenState extends State<ItemCompleteDetailScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    TabController _tabController = TabController(length: 1, vsync: this);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Badge(value: 2.toString(), color: Colors.red),
          SizedBox(width: width * 0.030,)
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.navigate_before), iconSize: 30, color: Colors.white,),
        elevation: 0,
        title: pageTitle(text: 'Product Details'),
        centerTitle: true,
        backgroundColor: AppColor.greenText,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  indicatorColor: Colors.white,
                  indicatorWeight: 4,
                  indicatorSize: TabBarIndicatorSize.label,
                  padding: EdgeInsets.only(bottom: 5),
                  physics: ScrollPhysics(),
                  isScrollable: true,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: appText(text: 'Details', color: Colors.white),
                    )
                  ]),
            ),
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children: [Detail()]),
    );
  }
}
