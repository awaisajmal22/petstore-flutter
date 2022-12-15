import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:petstore/screens/account/widgets/signin.dart';
import 'package:petstore/screens/cart/cart_screen.dart';
import 'package:petstore/screens/home/brands/brands.dart';
import 'package:petstore/screens/home/category/category_screen.dart';
import 'package:petstore/screens/home/home_screen.dart';
import 'package:petstore/screens/newarrival/new_arrival_screen.dart';
import 'package:petstore/screens/offers/offers_screen.dart';
import 'package:petstore/screens/account/account_screen.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/sharepreferrence.dart';
import 'package:petstore/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../screens/account/widgets/my_account.dart';

class BottomNavBar extends StatefulWidget {
  static const routeName = '/bottomnavbar';
  final BuildContext menuScreenContext;
  const BottomNavBar({super.key, required this.menuScreenContext});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final _auth = FirebaseAuth.instance.currentUser;
  PersistentTabController? _controller;
  bool? hideNavBar;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    hideNavBar = false;
  }

  List<Widget> _buildScreen() {
    final pref = Provider.of<SharedPref>(context);
    return [
      HomeScreen(),
      NewArrivalScreen(),
      OffersScreen(),
      pref.user == null
          ? AccountScreen(
              selectedPage: 0,
            )
          : MyAccount()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final pref = Provider.of<SharedPref>(context, listen: false);
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_rounded),
          title: ("Home"),
          activeColorPrimary: AppColor.green,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings:
              RouteAndNavigatorSettings(initialRoute: '/HomeScreen', routes: {
            // CategoryScreen.routeName: (context) => CategoryScreen(),
            ShopByBrands.routeName: (context) => ShopByBrands(),
            CartScreen.routeName: (context) => CartScreen()
          })),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.star),
        title: ("New Arrival"),
        activeColorPrimary: AppColor.green,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings:
              RouteAndNavigatorSettings(initialRoute: '/', routes: {
            CartScreen.routeName: (context) => CartScreen()
          })
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.gift),
        title: ("Offers"),
        activeColorPrimary: AppColor.green,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings:
              RouteAndNavigatorSettings(initialRoute: '/', routes: {
            CartScreen.routeName: (context) => CartScreen()
          })
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: ("Account"),
          activeColorPrimary: AppColor.green,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings:
              RouteAndNavigatorSettings(
                initialRoute: pref.user == null ? '/accountscreen' : '/myaccountScreen',
                routes: {
                  
                }
                ),
                ),
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
    extendBody: true,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreen(),
        items: _navBarsItems(),
        confineInSafeArea: true,

        backgroundColor: Colors.white54,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: 7.5 * SizeConfig.heightMultiplier,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        hideNavigationBar: hideNavBar,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.black,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property
      ),
    );
  }
}
