// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AppTheme {
  static ThemeData LightMode(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: Vx.blue100,
        cardColor: Vx.blue200,
        hintColor: Vx.black,
        appBarTheme: const AppBarTheme(
          color: Vx.blue100,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarContrastEnforced: true,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Vx.blue500,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: Colors.grey[700],
          ),
          helperStyle: TextStyle(
            color: Colors.grey[700],
          ),
          labelStyle: TextStyle(
            color: Colors.blue[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Vx.blue100,
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Vx.blue100),
      );

  static ThemeData DarkMode(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: Vx.gray900,
        cardColor: Vx.gray800,
        hintColor: Vx.white,
        appBarTheme: const AppBarTheme(
          color: Vx.gray800,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarContrastEnforced: true,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Vx.blue500,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: Colors.grey[700],
          ),
          helperStyle: TextStyle(
            color: Colors.grey[700],
          ),
          labelStyle: TextStyle(
            color: Colors.blue[600],
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Vx.gray900,
          unselectedItemColor: Vx.white,
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Vx.gray900),
      );

  static Color creamColor = const Color(0xFFDBEAFE);
  static Color darkBluishColor = const Color(0xff403b58);
}
