import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petstore/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/app_text.dart';
import '../../../../utils/app_text_button.dart';
import '../../../../utils/sharepreferrence.dart';
import '../../account_screen.dart';

Future dialogBox({required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (dailogContext) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 150,
            width: width,
            child: Column(
              children: [
                appText(
                    text: 'Are you sure?',
                    textAlignment: TextAlign.center,
                    fontsize: 20,
                    fontweight: FontWeight.w600),
                SizedBox(
                  height: 5,
                ),
                appText(
                    text: 'Do you want to Logout?',
                    textAlignment: TextAlign.center,
                    fontsize: 16,
                    fontweight: FontWeight.w400),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.yellow)),
                        child: AppTextButton.appTextButton(
                            onTap: () {
                              Navigator.of(dailogContext).pop();
                            },
                            height: 50,
                            width: 30 * SizeConfig.widthMultiplier,
                            textAlignment: Alignment.center,
                            text: 'cancel',
                            textFontWeight: FontWeight.w400,
                            textColor: Colors.yellow,
                            buttonColor: Colors.white,
                            radius: 10,
                            textFontSize: 15)),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 2,
                              color: Colors.yellow,
                            )),
                        child: AppTextButton.appTextButton(
                            onTap: () {
                              
                              Provider.of<SharedPref>(context,listen: false).removeData();
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).pop();
                              Navigator.of(dailogContext).popUntil(ModalRoute.withName('/'));
                            },
                            height: 50,
                            width: 30 * SizeConfig.widthMultiplier,
                            textAlignment: Alignment.center,
                            text: 'Logout',
                            textFontWeight: FontWeight.w400,
                            textColor: Colors.white,
                            buttonColor: Colors.yellow,
                            radius: 10,
                            textFontSize: 15))
                  ],
                )
              ],
            ),
          ),
        );
      });

}
