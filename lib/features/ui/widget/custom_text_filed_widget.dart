import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class TextFiledWidget extends StatelessWidget {
  Color? borderColor;
  String hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText;
  int? maxLines;
  String? Function(String?)? validator;
  TextEditingController? controller;
  double? radius;
  Color? errorColor;
  bool? filled;

  TextFiledWidget({this.borderColor,required this.hintText, this.hintStyle,
    this.maxLines,this.validator,this.controller,
  this.labelText, this.labelStyle , this.prefixIcon,this.suffixIcon,this.obscureText =false,
  this.errorColor , this.radius,this.filled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      obscuringCharacter: '*',
      maxLines:maxLines ?? 1 ,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle??AppStyles.light18Black,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled:filled?? true,
        fillColor: AppColors.whiteColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
          borderSide: BorderSide(
              color: borderColor ?? AppColors.whiteColor,
              width: 2
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
          borderSide: BorderSide(
              color: borderColor ?? AppColors.whiteColor,
              width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
          borderSide: BorderSide(
              color:errorColor ??  Colors.red,
              width: 2
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
          borderSide: BorderSide(
              color: errorColor ?? Colors.red,
              width: 2
          ),
        ),
      ),
    );
  }
}
