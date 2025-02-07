import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  Function onButtonClicked ;
  String text;
  TextStyle? textStyle;
  Color? backgroundColor;
  Widget? prefixIconButton;
  CustomElevatedButton({required this.onButtonClicked, required this.text,
  this.textStyle, this.backgroundColor,  this.prefixIconButton});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ElevatedButton(
        onPressed: (){
          onButtonClicked();
        },
      style: ElevatedButton.styleFrom(
        backgroundColor:backgroundColor?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: backgroundColor??AppColors.primaryColor)
        ),
        padding: EdgeInsets.symmetric(vertical: height*0.015)
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIconButton ?? SizedBox(),
            SizedBox(width: width*0.02,),
            Text(text,style: textStyle ?? AppStyles.semiBold24White,),
          ],
        ),
    );
  }
}
