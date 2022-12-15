import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petstore/utils/colors.dart';

CarouselSlider carouselSlider() {
  var images = [
    'assets/Dashboard/slider1.jpg',
    'assets/Dashboard/slider2.png',
    'assets/Dashboard/slider3.png',
    'assets/Dashboard/slider4.png',
  ];
  return CarouselSlider(
      items: [
        Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(width: 6, color: AppColor.white),
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(images[0]),
                fit: BoxFit.cover,
              ),
            )),
        Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(width: 6, color: AppColor.white),
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(images[1]),
                fit: BoxFit.cover,
              ),
            )),
            Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(width: 6, color: AppColor.white),
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(images[2]),
                fit: BoxFit.cover,
              ),
            )),
            Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(width: 6, color: AppColor.white),
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(images[3]),
                fit: BoxFit.cover,
              ),
            )),
      ],
      options: CarouselOptions(
        height: 250,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1,
      ));
}
