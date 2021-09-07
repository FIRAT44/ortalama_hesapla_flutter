import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk = Colors.indigo;

  static const String baslikText = 'Ortlama Hesapla';

  static final TextStyle baslikStyle = GoogleFonts.lato(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle dersSayisiStyle = GoogleFonts.lato(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);

  static final TextStyle ortalamaGosterBodyStyle = GoogleFonts.lato(
      fontSize: 16, fontWeight: FontWeight.w800, color: anaRenk);

  static final TextStyle ortalamaStyle = GoogleFonts.lato(
      fontSize: 55, fontWeight: FontWeight.w800, color: anaRenk);

  static final EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
