import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static final Color primaryColor = Color(0xFFB7935F);
  static final Color darkPrimaryColor = Color(0xFF242C4D);
  static final Color goldColor = Color(0xFFFACC1D);
  static final Color lightTabsColor = Color(0xFFf8f8f8);
  static final Color darkTabsColor = Color(0xFF12182b);

  static final ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 18, color: Colors.black),
        bodyText2: TextStyle(fontSize: 22, color: Colors.black),
        headline4: TextStyle(fontSize: 28, color: Colors.black),
        headline5: TextStyle(fontSize: 24, color: Colors.black),
        headline6: TextStyle(fontSize: 26, color: Colors.black),
      ),
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            //color set to transperent or set your own color
            statusBarIconBrightness: Brightness.dark,
            //set brightness for icons, like dark background light icons
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ));
  static final ThemeData darkTheme = ThemeData(
      primaryColor: darkPrimaryColor,
      secondaryHeaderColor: goldColor,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 18, color: goldColor),
        bodyText2: TextStyle(fontSize: 22, color: Colors.white),
        headline4: TextStyle(fontSize: 28, color: Colors.white),
        headline5: TextStyle(fontSize: 24, color: Colors.white),
        headline6: TextStyle(fontSize: 26, color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            //color set to transperent or set your own color
            statusBarIconBrightness: Brightness.light,
            //set brightness for icons, like dark background light icons
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: goldColor,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: goldColor,
        unselectedItemColor: Colors.white,
      ));
}
