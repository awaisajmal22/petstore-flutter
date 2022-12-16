import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/screens/account/account_screen.dart';
import 'package:petstore/screens/account/widgets/signin.dart';
import 'package:petstore/screens/cart/cart_screen.dart';
import 'package:petstore/screens/home/brands/brands.dart';
import 'package:petstore/utils/appbarwithsearch.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/sharepreferrence.dart';
import 'package:petstore/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/products.dart';
import '../account/widgets/my_account.dart';
import 'component/home_coursel_slider.dart';
import 'component/home_gridView.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance.currentUser;
  String? id;
  // bool userCheck = true;
  // @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<SharedPref>(context);
    final data = Provider.of<Products>(context, listen: false);
    final getData = data.items;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.lightgrey,
      appBar: CustomAppBarwithSearch(
      title: null,
        context: context,
      ),
      body: Stack(
        children: [
          Container(
            width: width,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                carouselSlider(),
                appText(
                    text: 'Shop by Category', textAlignment: TextAlign.left),
                SizedBox(height: 10),
                HomeGridView(
                    context: context,
                    height: height,
                    width: width,
                    data: getData),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ShopByBrands()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 80),
                    padding: EdgeInsets.all(20),
                    height: 150,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image:
                                AssetImage('assets/Dashboard/shopbyBrand.png'),
                            fit: BoxFit.cover)),
                  ),
                )
              ],
            ),
          ),
          pref.check == false
              ? Positioned(
                  bottom: height * 0.078,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: width,
                    height: 60,
                    color: Colors.white60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Text('Login'),
                          onPressed: () {
                            print(pref.check);
                            print(pref.user);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AccountScreen(selectedPage: 0)),
                                ModalRoute.withName(HomeScreen.routeName));
                          },
                        ),
                        Container(height: 50, width: 1, color: Colors.black),
                        TextButton(
                          child: Text('Create Account'),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) =>
                                    AccountScreen(selectedPage: 1))));
                          },
                        ),
                      ],
                    ),
                  ))
              : Container(),
        ],
      ),
    );
  }
}
