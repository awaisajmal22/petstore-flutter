import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/utils/customeAppBar.dart';

import '../../../utils/app_text_button.dart';
import '../../../utils/colors.dart';
import '../../../utils/textfeild.dart';

class EditPasswordScreen extends StatelessWidget {
  EditPasswordScreen({super.key});
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: 'Edit Password',
          actionButton: Container(),
          searchButton: Container()
          ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.060, vertical: 60),
        children: [
          SigninAndSignupTextField.textFormField(
              readOnly: false,
              hintText: 'Old Password',
              label: 'Old Password',
              labelFontFamily: '',
              labelColor: Colors.black,
              iconColor: null,
              labelFontSize: 20,
              labelFontWeight: FontWeight.w400,
              sufIcon: null,
              obSecureText: false,
              keyBoardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              isTextVisible: null,
              onSave: null,
              controller: oldPasswordController,
              countryCodePicker: null),
          SizedBox(
            height: 20,
          ),
          SigninAndSignupTextField.textFormField(
              readOnly: false,
              hintText: 'Password',
              label: 'Password',
              labelFontFamily: '',
              labelColor: Colors.black,
              iconColor: null,
              labelFontSize: 20,
              labelFontWeight: FontWeight.w400,
              sufIcon: null,
              obSecureText: false,
              keyBoardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              isTextVisible: null,
              onSave: null,
              controller: passwordController,
              countryCodePicker: null),
          SizedBox(
            height: 20,
          ),
          SigninAndSignupTextField.textFormField(
              readOnly: false,
              hintText: 'Confrim Password',
              label: 'Confrim Password',
              labelFontFamily: '',
              labelColor: Colors.black,
              iconColor: null,
              labelFontSize: 20,
              labelFontWeight: FontWeight.w400,
              sufIcon: null,
              obSecureText: false,
              keyBoardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              isTextVisible: null,
              onSave: null,
              controller: confrimPasswordController,
              countryCodePicker: null),
          SizedBox(
            height: 40,
          ),
          AppTextButton.appTextButton(
              onTap: () {},
              height: 60,
              width: width,
              textAlignment: Alignment.center,
              text: 'Save',
              textFontWeight: FontWeight.w600,
              textColor: Colors.white,
              buttonColor: AppColor.secondarycolor,
              radius: 10,
              textFontSize: 16)
        ],
      ),
    );
  }
}
