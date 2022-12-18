import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/screens/account/account_screen.dart';
import 'package:petstore/screens/account/widgets/component/forget_password.dart';
import 'package:petstore/screens/account/widgets/my_account.dart';
import 'package:petstore/utils/app_text.dart';
import 'package:petstore/utils/app_text_button.dart';
import 'package:petstore/utils/colors.dart';
import 'package:petstore/utils/snack_bar.dart';
import 'package:petstore/utils/textfeild.dart';

class SignIn extends StatefulWidget {
  final BuildContext singinContext;
  const SignIn({super.key, required this.singinContext});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isObsecureText = true;
  bool isValidate = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SigninAndSignupTextField.textFormField(
                readOnly: false,
                countryCodePicker: null,
                iconColor: null,
                controller: emailController,
                isTextVisible: null,
                keyBoardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                obSecureText: false,
                hintText: 'Email Address',
                label: 'Email Address',
                labelColor: Colors.grey,
                labelFontFamily: '',
                labelFontSize: 20,
                labelFontWeight: FontWeight.w500,
                sufIcon: null,
                onSave: (value) {
                  emailController.text = value!;
                },
              ),
              SigninAndSignupTextField.textFormField(
                readOnly: false,
                countryCodePicker: null,
                iconColor: Colors.grey,
                controller: passwordController,
                isTextVisible: () {
                  setState(() {
                    isObsecureText = !isObsecureText;
                  });
                },
                keyBoardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obSecureText: isObsecureText,
                hintText: 'Password',
                label: 'Password',
                labelColor: Colors.grey,
                labelFontFamily: '',
                labelFontSize: 20,
                labelFontWeight: FontWeight.w500,
                sufIcon:
                    isObsecureText ? Icons.visibility_off : Icons.visibility,
                onSave: (value) {
                  passwordController.text = value!;
                },
              ),
              SizedBox(height: 20),
              AppTextButton.appTextButton(
                  buttonColor: AppColor.secondarycolor,
                  radius: 20,
                  textColor: Colors.white,
                  textFontSize: 16,
                  textFontWeight: FontWeight.w600,
                  height: 60,
                  width: width,
                  onTap: () {
                    validate(emailController.text, passwordController.text);
                  },
                  text: 'Sign in',
                  textAlignment: Alignment.center),
              SizedBox(
                height: 40,
              ),
              AppTextButton.appTextButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword(
                                  width: width,
                                )));
                  },
                  height: 40.0,
                  width: 200,
                  textAlignment: Alignment.center,
                  text: 'Forgot Password?',
                  textFontWeight: FontWeight.w600,
                  textColor: Colors.black,
                  buttonColor: Colors.transparent,
                  radius: 10,
                  textFontSize: 20),
              appText(
                text: 'By Signing up, you agree to',
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appText(
                      text: 'our',
                    ),
                    AppTextButton.appTextButton(
                        onTap: () {
                          print('press 3');
                        },
                        height: 25,
                        width: 320,
                        textAlignment: Alignment.center,
                        text: 'Terms of Services & Privacy Policy',
                        textFontWeight: FontWeight.w600,
                        textColor: AppColor.greenText,
                        buttonColor: Colors.transparent,
                        radius: 0,
                        textFontSize: 20)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//  Validation Function
  void validate(String email, String password) async {
    final height = MediaQuery.of(context).size.height;
    final _auth = FirebaseAuth.instance;
    if (emailController.text.isEmpty) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
            color: Colors.red,
            error: 'Email is required',
            context: context);
      });
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(emailController.text)) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
            color: Colors.red,
            error: 'Please Enter Valid Email',
            context: context,
            );
      });
    } else if (passwordController.text.isEmpty) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
            color: Colors.red,
            error: 'Password is required',
            context: context,
            );
      });
    } else if (!RegExp(r'^.{6,}$').hasMatch(passwordController.text)) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
            color: Colors.red,
            error: 'Please Enter Valid Password',
            context: context,
            );
      });
    } else if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) {
        Navigator.of(widget.singinContext).push(
            MaterialPageRoute(builder: (context) => MyAccount()));
        setState(() {
          isValidate = true;
          Snackbar.snackBar(
            textColor: Colors.white,
              color: Colors.red,
              error: 'Successfully Login',
              context: context,
              );
        });
      }).catchError((e) {
        Snackbar.snackBar(
          textColor: Colors.white,
            error: 'Account Not Found',
            context: context,
            color: Colors.red);
      });
    }
  }
}
