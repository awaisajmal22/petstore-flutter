import 'package:country_code_picker/country_code_picker.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class SigninAndSignupTextField {
  static textFormField(
      {
        required bool readOnly,
      required String? hintText,
      required String label,
      required String labelFontFamily,
      required Color labelColor,
      required Color? iconColor,
      required double labelFontSize,
      required FontWeight labelFontWeight,
      required IconData? sufIcon,
      required bool obSecureText,
      required TextInputType keyBoardType,
      required TextInputAction textInputAction,
      required Function()? isTextVisible,
      required Function(String?)? onSave,
      required TextEditingController? controller,
      required CountryCodePicker? countryCodePicker,
      }) {
    return TextFormField(
      readOnly: readOnly,
      onSaved: onSave,
      autofocus: false,
      controller: controller,
      textInputAction: textInputAction,
      obscureText: obSecureText,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
          hintText: hintText,
          label: Text(label),
          labelStyle: TextStyle(
            color: labelColor,
            fontSize: labelFontSize,
            fontWeight: labelFontWeight,
            fontFamily: labelFontFamily,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          suffixIcon: GestureDetector(
            onTap: isTextVisible,
            child: Icon(sufIcon, color: iconColor,),
          ),
          prefixIcon: countryCodePicker,
          ),
          
    );
  }
}
