import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petstore/utils/app_text_button.dart';
import 'package:petstore/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../../../../utils/sharepreferrence.dart';
import '../../../../../account/account_screen.dart';

class CarouselWithDotsPage extends StatefulWidget {
  @override
  _CarouselWithDotsPageState createState() => _CarouselWithDotsPageState();
}

class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
  int _current = 0;
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<SharedPref>(context,listen: false);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var shareandunheartFunction = [
      () {},
      () {
        if (pref.user == null) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => AccountScreen(selectedPage: 0))));
        } else {
          print('user Loged in');
          setState(() {
          isPressed = !isPressed;
        });
        }

        
      }
    ];
    var shareandunheartIcon = [
      Icon(Icons.file_upload_outlined),
      Icon(
        Icons.favorite_border_outlined,
        color: isPressed == false ? Colors.black : Colors.red,
      )
    ];
    List<String> imgList = [
      'assets/Dashboard/placeholder.png',
      'assets/Dashboard/placeholder.png',
      'assets/Dashboard/placeholder.png',
      'assets/Dashboard/placeholder.png',
    ];
    final imageSliders = imgList
        .map((item) => Container(
              width: width * 0.60,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ],
                ),
              ),
            ))
        .toList();

    return Container(
      height: height * 0.35,
      margin: EdgeInsets.symmetric(horizontal: width * 0.060),
      child: Stack(
        children: [
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imgList.length, (index) {
                  return Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 3,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? Colors.white : Colors.grey,
                      ));
                })),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      2,
                      (index) => GestureDetector(
                            onTap: shareandunheartFunction[index],
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.lightgrey),
                              child: shareandunheartIcon[index],
                            ),
                          ))))
        ],
      ),
    );
  }
}
