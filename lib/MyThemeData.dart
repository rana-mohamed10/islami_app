
import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightprimary=Color(0xFFB7935F);
  static const Color darkprimary=Color(0xFF141A2E);
  static const Color darksecondry=Color(0xFFF9CB1A);
  static const Color darktertary=Color(0xFF151C31);



  static ThemeData lighttheme=  ThemeData(
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ) ,
      bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black
      ) ,
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.black
      ) ,
    ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFB7935F)),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(size: 32)),
      dividerColor: Color(0xFFB7935F),
      cardTheme: CardTheme(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18))));

  static ThemeData darktheme=  ThemeData(
      textTheme:const TextTheme(
        headlineSmall: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ) ,
        bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white
        ) ,
        titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white
        ) ,
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
          seedColor: darkprimary,
          primary: darkprimary,
          secondary: darkprimary,
          onPrimary: Colors.white,
           onSecondary: darksecondry),
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: MyThemeData.darkprimary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: darksecondry,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 32)),
      dividerColor: darksecondry,
      cardTheme: CardTheme(
          color: darktertary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18))));

}