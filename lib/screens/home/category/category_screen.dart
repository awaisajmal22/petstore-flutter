import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/screens/home/category/component/category_GridView.dart';
import 'package:petstore/screens/search_screen.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/customeAppBar.dart';
import 'package:petstore/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

import '../../../model/product.dart';
import '../../../utils/badge.dart';
import '../../cart/cart_screen.dart';
import 'component/category_name_image.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/CategoryScreen';
  const CategoryScreen(
      {super.key,
      required this.categoryName,
      required this.image,
      required this.color,
      required this.productImage});
  final List productImage;
  final String categoryName;
  final String image;
  final Color color;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _enable = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future loadData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _enable = false;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightgrey,
      appBar: customAppBar(
        context: context, 
        title: widget.categoryName,
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
        children: [
          categoryNameWithImage(
              categoryName: widget.categoryName,
              image: widget.image,
              color: widget.color),
          categoryGridView(
            context: context,
            productImage: widget.productImage,
          ),
          SizedBox(
            height: 7.5 * SizeConfig.heightMultiplier,
          )
        ],
      ),
    );
  }
}
