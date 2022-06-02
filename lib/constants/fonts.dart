// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle bigText(
    {required Color color,
    required FontWeight weight,
    double? size,
    double? letterspacing,
    TextDecoration? decoration,
    double? height}) {
  return GoogleFonts.dmSans(
      color: color,
      fontWeight: weight,
      decoration: decoration,
      fontSize: size,
      height: height,
      letterSpacing: letterspacing);
}

TextStyle screenText(
    {required Color color,
    required FontWeight weight,
    double? size,
    double? lettspacing,
    TextDecoration? decoration,
    double? height}) {
  return GoogleFonts.sora(
      color: color,
      fontWeight: weight,
      fontSize: size,
      decoration: decoration,
      height: height,
      letterSpacing: lettspacing);
}
