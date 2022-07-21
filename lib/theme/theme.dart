import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1newone/theme/colors/color.dart';


class AppTheme {
  static final lightTheme = ThemeData(
    // fontFamily: 'Schyler',
    scaffoldBackgroundColor: LightColors.white,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        // statusBarColor: LightColors.cc,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: LightColors.cc,
      elevation: 2.0,
      titleTextStyle: TextStyle(
        color: LightColors.a,
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
      ),
      iconTheme: IconThemeData(
        color:Colors.black,// LightColors.bb,
        size: 30,
      ),
    ),


    textTheme: TextTheme(
      headline1: TextStyle(
        letterSpacing: 1.2,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: LightColors.k,
      ),
      headline2: TextStyle(
        letterSpacing: 1.2,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: LightColors.l,
      ),
      headline3: TextStyle(
        letterSpacing: 1.2,
        fontSize: 18.0,
        fontWeight: FontWeight.w900,
        color: LightColors.q,
      ),
      headline4: TextStyle(
        letterSpacing: 0.5,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: LightColors.green,
      ),
      headline5: TextStyle(
        letterSpacing: 0.5,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: LightColors.f,
      ),
      headline6: TextStyle(
        letterSpacing: 0.6,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: LightColors.grey2,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: LightColors.t,
      ),
      subtitle2: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: LightColors.j,
      ),
      bodyText1: TextStyle(
        letterSpacing: 0.8,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: LightColors.butto,
      ),
      button: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: LightColors.t,
      ),
    ),
    cardColor: LightColors.h,
    iconTheme: IconThemeData(
      color: LightColors.white,
      size: 30,
    ),
    bottomAppBarColor: LightColors.bb,
    backgroundColor: LightColors.b,
    canvasColor: LightColors.cc,
    primarySwatch: Colors.indigo,
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: DarkColors.black4,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        //statusBarColor: DarkColors.cc,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: DarkColors.cc,
      elevation: 2.0,
      titleTextStyle: TextStyle(
        color: DarkColors.a,
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
      ),
      iconTheme: IconThemeData(
        color: DarkColors.bb,
        size: 30,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        letterSpacing: 1.2,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: DarkColors.k,
      ),
      headline2: TextStyle(
        letterSpacing: 1.2,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: DarkColors.l,
      ),
      headline3: TextStyle(
        letterSpacing: 1.2,
        fontSize: 18.0,
        fontWeight: FontWeight.w900,
        color: DarkColors.q,
      ),
      headline4: TextStyle(
        letterSpacing: 0.5,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: DarkColors.green,
      ),
      headline5: TextStyle(
        letterSpacing: 0.5,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: DarkColors.f,
      ),
      headline6: TextStyle(
        letterSpacing: 0.6,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: DarkColors.grey2,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: DarkColors.t,
      ),
      subtitle2: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: DarkColors.j,
      ),
      bodyText1: TextStyle(
        letterSpacing: 0.8,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: DarkColors.butto,
      ),
      button: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: DarkColors.t,
      ),
    ),
    cardColor: DarkColors.h,
    iconTheme: IconThemeData(
      color: DarkColors.black3,
      size: 30,
    ),
    bottomAppBarColor: DarkColors.bb,
    backgroundColor: DarkColors.b,
    canvasColor: DarkColors.cc,
    primarySwatch: Colors.amber,
  );

}

