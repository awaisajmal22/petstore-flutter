import 'package:flutter/material.dart';
import 'package:petstore/utils/app_text.dart';

import '../items/product_items_screen.dart';

GridView categoryGridView({
  required BuildContext context,
  required List productImage
  }
) {
  return GridView.count(
    crossAxisCount: 2,
    childAspectRatio: 3 / 3,
     shrinkWrap: true,
    controller: ScrollController(keepScrollOffset: false),
    scrollDirection: Axis.vertical,
    children: List.generate(productImage.length, (index) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductItemsScreen())
          );
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(
                productImage[index]
              ),
              fit: BoxFit.cover
            ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 0,
                  left: 0,
                  child: appText(text: 'text', textAlignment: TextAlign.center))
              ],
            ),
        ),
      );
    }),
  );
}
