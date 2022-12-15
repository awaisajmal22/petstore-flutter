import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/screens/account/account_screen.dart';
import 'package:petstore/screens/account/profile/edit_profile_screen.dart';
import 'package:petstore/screens/account/widgets/my%20account%20component/alertdailogbox.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/app_text_button.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/sharepreferrence.dart';

class MyAccount extends StatefulWidget {
  static const routeName = '/myaccountScreen';
  MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final _auth = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    final pref = Provider.of<SharedPref>(context, listen: false);
    pref.savePref(_auth!.uid);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lisTileLeadingIcon = [
      'assets/MyAccount/myaccount.png',
      'assets/MyAccount/address.png',
      'assets/MyAccount/wishlist.png',
      'assets/MyAccount/order.png',
      'assets/MyAccount/logout.png',
    ];
    var listTileName = [
      'My Account',
      'Address Book',
      'Wishlist',
      'My Order',
      'Logout',
    ];
    var callandEmail = [
      'Call',
      'Email',
    ];
    var listTileButton = [
      //my account
      () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EditProfileScreen()));
      },
      //address
      () {},
      //wishlist
      () {},
      //order
      () {},
      //logout
      () {
        dialogBox(
          context: context,
        );
      },
    ];
    var onPressed = [() {}, () {}];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.lightgrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text('My Account'),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logos/logo.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: width,
            margin: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(text: "we're here for you 24/7"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      2,
                      (index) => AppTextButton.appTextButton(
                          onTap: onPressed[index],
                          height: 40,
                          width: width * 0.45,
                          textAlignment: Alignment.center,
                          text: callandEmail[index],
                          textFontWeight: FontWeight.w500,
                          textColor: Colors.black,
                          buttonColor: Colors.white,
                          radius: 30,
                          textFontSize: 20)),
                ),
                SizedBox(
                  height: 60,
                ),
                appText(text: 'My Info'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 400,
            width: width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: ListView.builder(
                controller: ScrollController(keepScrollOffset: false),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: listTileButton[index],
                    child: Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              top: index == 0
                                  ? BorderSide(color: Colors.white)
                                  : BorderSide(
                                      width: 1,
                                      color: Colors.black.withOpacity(0.5)))),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(lisTileLeadingIcon[index])),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          appText(text: listTileName[index]),
                          Spacer(),
                          Icon(Icons.navigate_next)
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }

  void _signOut(BuildContext context) {}
}
