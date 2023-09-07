import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle heading1({color = Colors.white}) {
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: color,
    );
  }

  static TextStyle heading2({color = Colors.white}) {
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle title({color = Colors.white}) {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle card() {
    return GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle timer() {
    return GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle modal() {
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }
}
