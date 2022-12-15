import 'package:flutter/material.dart';

class Product {
  final String id;
  final String category;
  final String productName;
  final String categoryImage;
  final String categoryImageUrl;
  final List<dynamic> foodimageUrl;
  final Color color;

  Product({
    required this.categoryImage,
    required this.id,
    required this.category,
    required this.productName,
    required this.categoryImageUrl,
    required this.foodimageUrl,
    required this.color,
  });
}

List<Product> data = [
  Product(
    color: Colors.red.shade200,
      categoryImage: 'assets/category/category1.png',
      id: '1',
      category: 'Dog',
      productName: 'ab',
      categoryImageUrl: 'assets/Dashboard/shop1.png',
      foodimageUrl: [
        'assets/ShopData/food1.png',
        'assets/ShopData/food2.png',
        'assets/ShopData/food3.png',
        'assets/ShopData/food4.png',
        'assets/ShopData/food5.png',
        'assets/ShopData/food6.png',
      ]),
  Product(
    color: Colors.greenAccent.shade200,
      categoryImage: 'assets/category/category2.png',
      id: '2',
      category: 'Cat',
      productName: 'ab',
      categoryImageUrl: 'assets/Dashboard/shop6.png',
      foodimageUrl: [
        'assets/ShopData/food1.png',
        'assets/ShopData/food2.png',
        'assets/ShopData/food3.png',
        'assets/ShopData/food4.png',
        'assets/ShopData/food5.png',
        'assets/ShopData/food6.png',
      ]),
  Product(
    color: Colors.blueAccent.shade200,
      categoryImage: 'assets/category/category3.png',
      id: '3',
      category: 'Fish',
      productName: 'ab',
      categoryImageUrl: 'assets/Dashboard/shop4.png',
      foodimageUrl: [
        'assets/ShopData/food1.png',
        'assets/ShopData/food2.png',
        'assets/ShopData/food3.png',
        'assets/ShopData/food4.png',
        'assets/ShopData/food5.png',
        'assets/ShopData/food6.png',
      ]),
  Product(
    color: Colors.purpleAccent.shade200,
      categoryImage: 'assets/category/category4.png',
      id: '4',
      category: 'Small Pets',
      productName: 'ab',
      categoryImageUrl: 'assets/Dashboard/shop2.png',
      foodimageUrl: [
        'assets/ShopData/food1.png',
        'assets/ShopData/food2.png',
        'assets/ShopData/food3.png',
        'assets/ShopData/food4.png',
        'assets/ShopData/food5.png',
        'assets/ShopData/food6.png',
      ]),
  Product(
    color: Colors.green.shade200,
      categoryImage: 'assets/category/category5.png',
      id: '5',
      category: 'Birds',
      productName: 'ab',
      categoryImageUrl: 'assets/Dashboard/shop5.png',
      foodimageUrl: [
        'assets/ShopData/food1.png',
        'assets/ShopData/food2.png',
        'assets/ShopData/food3.png',
        'assets/ShopData/food4.png',
        'assets/ShopData/food5.png',
        'assets/ShopData/food6.png',
      ]),
  Product(
    color: Colors.yellowAccent,
      categoryImage: 'assets/category/category6.png',
      id: '6',
      category: 'Reptile',
      productName: 'ab',
      categoryImageUrl: 'assets/Dashboard/shop3.png',
      foodimageUrl: [
        'assets/ShopData/food1.png',
        'assets/ShopData/food2.png',
        'assets/ShopData/food3.png',
        'assets/ShopData/food4.png',
        'assets/ShopData/food5.png',
        'assets/ShopData/food6.png',
      ]),
];
