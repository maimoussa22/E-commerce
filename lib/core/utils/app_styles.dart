import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles{
  static TextStyle medium18White= GoogleFonts.poppins(
  color: AppColors.whiteColor,
  fontSize: 18,
  fontWeight: FontWeight.w500
  );
  static TextStyle medium14Navy= GoogleFonts.poppins(
  color: AppColors.navyColor,
  fontSize: 14,
  fontWeight: FontWeight.w500
  );
  static TextStyle light18Black= GoogleFonts.poppins(
  color: AppColors.black70AColor,
  fontSize: 18,
  fontWeight: FontWeight.w300
  );
  static TextStyle regular18White= GoogleFonts.poppins(
  color: AppColors.whiteColor,
  fontSize: 18,
  fontWeight: FontWeight.normal
  );
  static TextStyle semiBold24White= GoogleFonts.poppins(
  color: AppColors.whiteColor,
  fontSize: 24,
  fontWeight: FontWeight.w600
  );
  static TextStyle semiBold20Primary= GoogleFonts.poppins(
  color: AppColors.primaryColor,
  fontSize: 20,
  fontWeight: FontWeight.w600
  );
  static TextStyle light16White= GoogleFonts.poppins(
      color: AppColors.whiteColor,
      fontSize: 16,
      fontWeight: FontWeight.w300
  );

}