import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/app_text.dart';
import '../../utils/badge.dart';
import '../../utils/colors.dart';
import '../cart/cart_screen.dart';
import '../search_screen.dart';

class NewArrivalScreen extends StatelessWidget {
  const NewArrivalScreen({super.key});
  static const routeName = '/newArrival';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen()));

          },
          icon: Icon(Icons.search),
          iconSize: 30,
          color: Colors.white,
        ),
        elevation: 0,
        title: pageTitle(text: 'New Arrivals'),
        centerTitle: true,
        backgroundColor: AppColor.greenText,
        actions: [
          Badge(
            value: 2.toString(),
            color: Colors.red,
          ),
          SizedBox(
            width: width * 0.030,
          )
        ],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(
          child: appText(text: 'NO Data Found'),
        ),
      ),
    );
  }
}
