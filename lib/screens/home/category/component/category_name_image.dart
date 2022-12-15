import 'package:flutter/material.dart';

import '../../../../model/product.dart';
import '../../../../utils/app_text.dart';

Container categoryNameWithImage(
  {
    required String categoryName,
    required String image,
    required Color color,
  }
) {
    return Container(
          height: 200,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
            
          ),
          child: Stack(
            children: [
              Positioned( 
                right: 0,
                child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill
            )
                ),
                )
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     pageTitle(text: 'Shop',fontsize: 20,color: Colors.white.withOpacity(0.7),fontweight: FontWeight.w400),
                    pageTitle(text: categoryName,fontsize: 30,)
                  ],
                ))
            ],
          ),
        );
  }