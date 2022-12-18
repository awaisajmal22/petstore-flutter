import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/utils/app_text_button.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/customeAppBar.dart';
import 'package:petstore/utils/snack_bar.dart';
import 'package:petstore/utils/textfeild.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key, required this.width});
  double width;

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  customAppBar(
              context: context,
              title: 'Forgot Password',
              actionButton: Container(),
              searchButton: Container(),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 30, right: 30),
        children: [
          SizedBox(
            height: 60,
          ),
          SigninAndSignupTextField.textFormField(
              readOnly: false,
              hintText: 'Email',
              label: 'Email',
              labelFontFamily: '',
              labelColor: Colors.black,
              iconColor: null,
              labelFontSize: 20,
              labelFontWeight: FontWeight.w600,
              sufIcon: null,
              obSecureText: false,
              keyBoardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              isTextVisible: null,
              controller: _controller,
              countryCodePicker: null,
              onSave: (value) {
                _controller.text = value!;
              }),
          SizedBox(
            height: 50,
          ),
          AppTextButton.appTextButton(
              onTap: () {
                Snackbar.snackBar(
                  textColor: AppColor.green,
                    error: 'Enter Email',
                    context: context,
                    color: Colors.white);
              },
              height: 60,
              width: widget.width,
              textAlignment: Alignment.center,
              text: 'Send',
              textFontWeight: FontWeight.w600,
              textColor: Colors.white,
              buttonColor: Colors.yellow,
              radius: 20,
              textFontSize: 20)
        ],
      ),
    );
  }
}
