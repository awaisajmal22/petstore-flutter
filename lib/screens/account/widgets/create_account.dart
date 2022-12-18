
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/utils/app_text_button.dart';
import 'package:petstore/utils/textfeild.dart';

import '../../../utils/snack_bar.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isObsecure = true;
  bool isObsecure2 = true;
  bool isValidate = false;
  String? userCountryCode;
  void _onChange(CountryCode countryCode) {
    userCountryCode = countryCode.toString();

    print('Country Selected' + countryCode.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String? systemCountryCode = '+92';
    userCountryCode = systemCountryCode;
  }

  void check() {
    print('full :' + userCountryCode! + phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              // First Name
              SigninAndSignupTextField.textFormField(
                readOnly: false,
                  countryCodePicker: null,
                  hintText: 'First Name*',
                  label: 'First Name*',
                  labelFontFamily: '',
                  labelColor: Colors.black,
                  iconColor: null,
                  labelFontSize: 16,
                  labelFontWeight: FontWeight.w400,
                  sufIcon: null,
                  obSecureText: false,
                  keyBoardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  isTextVisible: null,
                  controller: firstNameController,
                  onSave: (value) {
                    firstNameController.text = value!;
                  }),
              // Last Name
              SigninAndSignupTextField.textFormField(
                readOnly: false,
                  onSave: (value) {
                    lastNameController.text = value!;
                  },
                  countryCodePicker: null,
                  hintText: 'Last Name*',
                  label: 'Last Name*',
                  labelFontFamily: '',
                  labelColor: Colors.black,
                  iconColor: null,
                  labelFontSize: 16,
                  labelFontWeight: FontWeight.w400,
                  sufIcon: null,
                  obSecureText: false,
                  keyBoardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  isTextVisible: null,
                  controller: lastNameController),
              //  Email
              SigninAndSignupTextField.textFormField(
                readOnly: false,
                  onSave: (value) {
                    emailController.text = value!;
                  },
                  countryCodePicker: null,
                  hintText: 'Email*',
                  label: 'Email*',
                  labelFontFamily: '',
                  labelColor: Colors.black,
                  iconColor: null,
                  labelFontSize: 16,
                  labelFontWeight: FontWeight.w400,
                  sufIcon: null,
                  obSecureText: false,
                  keyBoardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  isTextVisible: null,
                  controller: emailController),
              // Phone Number
              SigninAndSignupTextField.textFormField(
                readOnly: false,
                  onSave: (value) {
                    phoneController.text = value!;
                  },
                  countryCodePicker: CountryCodePicker(
                    onChanged: _onChange,
                    showFlagDialog: true,
                    showFlag: false,
                    initialSelection: userCountryCode,
                    favorite: ['+92', 'PK'],
                    alignLeft: false,
                  ),
                  hintText: 'Phone*',
                  label: 'Phone*',
                  labelFontFamily: '',
                  labelColor: Colors.black,
                  iconColor: null,
                  labelFontSize: 16,
                  labelFontWeight: FontWeight.w400,
                  sufIcon: null,
                  obSecureText: false,
                  keyBoardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  isTextVisible: null,
                  controller: phoneController),
              // Password
              SigninAndSignupTextField.textFormField(
                readOnly: false,
                  onSave: (value) {
                    passwordController.text = value!;
                  },
                  countryCodePicker: null,
                  hintText: 'Password*',
                  label: 'Password*',
                  labelFontFamily: '',
                  labelColor: Colors.black,
                  iconColor: null,
                  labelFontSize: 16,
                  labelFontWeight: FontWeight.w400,
                  sufIcon: isObsecure ? Icons.visibility_off : Icons.visibility,
                  obSecureText: isObsecure,
                  keyBoardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  isTextVisible: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                  controller: passwordController),
              // Confirm Password
              SigninAndSignupTextField.textFormField(
                readOnly: false,
                  onSave: (value) {
                    confirmPasswordController.text = value!;
                  },
                  countryCodePicker: null,
                  hintText: 'Confirm Password*',
                  label: 'Confirm Password*',
                  labelFontFamily: '',
                  labelColor: Colors.black,
                  iconColor: null,
                  labelFontSize: 16,
                  labelFontWeight: FontWeight.w400,
                  sufIcon:
                      isObsecure2 ? Icons.visibility_off : Icons.visibility,
                  obSecureText: isObsecure2,
                  keyBoardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  isTextVisible: () {
                    setState(() {
                      isObsecure2 = !isObsecure2;
                    });
                  },
                  controller: confirmPasswordController),
              SizedBox(
                height: 40,
              ),
              AppTextButton.appTextButton(
                  onTap: () {
                    validate();
                  },
                  height: 60,
                  width: width,
                  textAlignment: Alignment.center,
                  text: 'Create Account',
                  textFontWeight: FontWeight.w600,
                  textColor: Colors.white,
                  buttonColor: Colors.yellow,
                  radius: 20,
                  textFontSize: 20)
            ],
          ),
        ),
      ),
    );
  }

//  Validation Function
  void validate() {
    final height = MediaQuery.of(context).size.height;
    if (firstNameController.text.isEmpty) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
          color: Colors.red,
           error: 'First Name is required', context: context);
      });
    } else if (lastNameController.text.isEmpty) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
          color: Colors.red,
           error: 'Last Name is required', context: context);
      });
    } else if (emailController.text.isEmpty) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
          color: Colors.red,
           error: 'Email is required', context: context);
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
    } else if (phoneController.text.isEmpty) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
          color: Colors.red,
            error: 'Phone Number is required',
            context: context);
      });
    } else if (passwordController.text.isEmpty) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
          color: Colors.red,
            error: 'Password is required', context: context,
            );
      });
    } else if (!RegExp(r'^.{6,}$').hasMatch(passwordController.text)) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
          color: Colors.red,
            error: 'Please Enter Valid Password',
            context: context,);
      });
    } else if (confirmPasswordController.text.isEmpty) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
          color: Colors.red,
            error: 'Confirm Password required',
            context: context);
      });
    } else if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        isValidate = false;
        Snackbar.snackBar(
          textColor: Colors.white,
          color: Colors.red,
           error: 'Password do not match', context: context);
      });
    } else if (_formKey.currentState!.validate()) {
      setState(() {
        isValidate = true;
        Snackbar.snackBar(
          textColor: Colors.white,
          color: Colors.red,
            error: 'Successfully Login', context: context,
            );
      });
    }
  }
}
