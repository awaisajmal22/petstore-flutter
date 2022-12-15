import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/screens/account/widgets/create_account.dart';
import 'package:petstore/screens/account/widgets/my_account.dart';
import 'package:petstore/screens/home/home_screen.dart';
import 'package:petstore/utils/app_nav_bar.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/sharepreferrence.dart';
import 'package:provider/provider.dart';

import 'widgets/signin.dart';

class AccountScreen extends StatefulWidget {
  static const routeName = '/accountscreen';
  final int selectedPage;
  AccountScreen({super.key, required this.selectedPage});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  List<MyTabs> _tabs = [
    MyTabs(title: 'Sign In'),
    MyTabs(title: "Create Account")
  ];
  MyTabs? _myTabs;
  TabController? _controller;
  int? index;
  @override
  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();

    _controller = TabController(
        length: 2, vsync: this, initialIndex: widget.selectedPage);
    _myTabs = _tabs[0];
    _controller?.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _myTabs = _tabs[_controller!.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.green,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  pageTitle(text: _myTabs!.title),
                  SizedBox(
                    height: 40,
                  ),
                  TabBar(
                      padding: EdgeInsets.only(bottom: 10),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.amber,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.amberAccent,
                      physics: NeverScrollableScrollPhysics(),
                      controller: _controller,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      tabs: [
                        Container(
                          height: 50,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 2, color: Colors.white)),
                          child: Tab(
                            text: _tabs[0].title,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 2, color: Colors.white)),
                          child: Tab(
                            text: _tabs[1].title,
                          ),
                        )
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            SignIn(
              singinContext: context,
            ),
            CreateAccount()
          ]),
    );
  }
}

class MyTabs {
  final String title;
  MyTabs({required this.title});
}
