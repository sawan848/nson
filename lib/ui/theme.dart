import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/theme_services.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color darkGreyClr = Color(0xFF121212);
const Color white =Colors.white;
const Color darkHeaderClr =  Color(0xFF424242);
const primaryClr =bluishClr;


class Themes {

  static final light = ThemeData(
    primarySwatch: Colors.blue, //upper
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white, //background
  );
  static final dark = ThemeData(
      primarySwatch: Colors.grey,
      backgroundColor: darkHeaderClr,
       scaffoldBackgroundColor: Colors.grey);
}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato (
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color:ThemeService().theme==ThemeMode.dark? Colors.grey[599] : Colors.grey,
    )

  );

}
TextStyle get titleStyle{
  return GoogleFonts.lato (
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color:ThemeService().theme==ThemeMode.dark? Colors.white : Colors.black,
    )

  );

}
TextStyle get subTitleStyle{
  return GoogleFonts.lato (
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color:ThemeService().theme==ThemeMode.dark? Colors.grey[100] : Colors.grey[600],
    )

  );

}

TextStyle get headingStyle{
  return GoogleFonts.lato (
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color:ThemeService().theme==ThemeMode.dark? Colors.white : Colors.black,
       
    )

  );

}