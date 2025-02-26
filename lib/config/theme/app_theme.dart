import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.openSansTextTheme(),
      colorSchemeSeed: Colors.green,
      appBarTheme: const AppBarTheme(
          elevation: 5,
          shadowColor: Color(0xFF314f4d),
          color: Color.fromARGB(255, 52, 164, 30)));
}
