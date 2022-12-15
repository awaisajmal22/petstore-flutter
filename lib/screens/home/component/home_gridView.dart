import 'package:flutter/material.dart';
import 'package:petstore/model/product.dart';
import 'package:petstore/screens/home/category/category_screen.dart';
import 'package:petstore/utils/app_text.dart';

GridView HomeGridView({required BuildContext context,required double height,required double width,
required List<Product> data
}) {
  return GridView.count(
    crossAxisCount: 2,
    childAspectRatio: (3 / 3),
    shrinkWrap: true,
    crossAxisSpacing: 10,
    controller: ScrollController(keepScrollOffset: false),
    scrollDirection: Axis.vertical,
    children: List.generate(data.length, (index) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CategoryScreen(
              color: data[index].color,
              image: data[index].categoryImage,
              categoryName: data[index].category,
              productImage: data[index].foodimageUrl.toList(),
            ))
          );
        },
        child: Container(
            margin: EdgeInsets.symmetric( vertical: 10),
            padding: EdgeInsets.only(top: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(
                      data[index].categoryImageUrl),
                  fit: BoxFit.cover),
            ),
            ),
      );
    }),
  );
}
