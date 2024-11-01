import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_first/style/color_style.dart';

class FontFamily {
  static TextStyle tittle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: ColorStyle.blackColor ,
    fontFamily: GoogleFonts.tiltNeon().fontFamily,
  );
   static TextStyle subTittle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: ColorStyle.accentColor,
    fontFamily: GoogleFonts.tiltNeon().fontFamily,
  );


  static TextStyle textButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorStyle.whiteColor,
    fontFamily: GoogleFonts.robotoFlex().fontFamily,
  );

  static TextStyle text = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorStyle.textColor,
    fontFamily: GoogleFonts.robotoFlex().fontFamily,
  );

  // textfieldtext
  static TextStyle textFieldText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: ColorStyle.textColor,
    fontFamily: GoogleFonts.robotoFlex().fontFamily,
  );

    static TextStyle tittleCategoris = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: ColorStyle.blackColor,
    fontFamily: GoogleFonts.robotoFlex().fontFamily,
  );
  
}
