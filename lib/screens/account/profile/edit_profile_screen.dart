import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/screens/account/profile/edit_password_screen.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/app_text_button.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/customeAppBar.dart';
import 'package:petstore/utils/size_config.dart';
import 'package:petstore/utils/textfeild.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final _auth = FirebaseAuth.instance.currentUser;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: 'Edit Profile',
          actionButton: AppTextButton.appTextButton(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditPasswordScreen()));
            }, height: 40, width: 20 * SizeConfig.widthMultiplier, textAlignment: Alignment.centerRight, text: 'Edit Password',
             textFontWeight: FontWeight.w400, 
             textColor: Colors.white, 
             buttonColor: Colors.transparent, radius: 0, textFontSize: 10),
           searchButton: Container()
                  ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.060, vertical: 60),
        children: [
          SigninAndSignupTextField.textFormField(
              readOnly: false,
              hintText: null,
              label: 'First Name',
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
              controller: firstNameController,
              countryCodePicker: null),
          SizedBox(
            height: 20,
          ),
          SigninAndSignupTextField.textFormField(
              readOnly: false,
              hintText: null,
              label: 'Last Name',
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
              controller: firstNameController,
              countryCodePicker: null),
          SizedBox(
            height: 20,
          ),
          SigninAndSignupTextField.textFormField(
              readOnly: true,
              hintText: null,
              label: 'Email',
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
              controller: emailController..text = _auth!.email.toString(),
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
