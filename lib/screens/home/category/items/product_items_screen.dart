import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/screens/home/category/items/itemsdetail/items_info_screen.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/customeAppBar.dart';

import '../../../../utils/badge.dart';
import '../../../cart/cart_screen.dart';
import '../../../search_screen.dart';

class ProductItemsScreen extends StatelessWidget {
  const ProductItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightgrey,
      appBar: customAppBar(
        context: context, 
        title: 'Dog Threats',
        actionButton: Badge(
              value: 2.toString(), color: Colors.red),
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 60),
          productItemsGridView(context),
          SizedBox(height: 60),
        ],
      ),
    );
  }

  GridView productItemsGridView(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      controller: ScrollController(keepScrollOffset: false),
        crossAxisCount: 2,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        scrollDirection: Axis.vertical,
        children: List.generate(10, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemsInfoScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/Dashboard/placeholder.png'), fit: BoxFit.cover),
              ),
            ),
          );
        }));
  }
}
