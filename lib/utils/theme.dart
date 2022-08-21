import 'package:dash/common.dart';
import 'package:flutter/material.dart';

ThemeData commonTheme() => ThemeData(
    textTheme: const TextTheme(
      headline6: TextStyle(
          fontFamily: Common.fontNameDefault,
          fontSize: Common.mediumTextSize,
          color: Common.textColor,
          fontWeight: FontWeight.bold),
      headline4: TextStyle(
        fontFamily: Common.fontNameDefault,
        fontSize: Common.mediumTextSize,
        fontWeight: FontWeight.w800,
        color: Common.textColor,
      ),
      bodyText1: TextStyle(
          fontFamily: Common.fontNameDefault,
          fontSize: Common.bodyTextSize,
          color: Common.textColor,
          fontWeight: FontWeight.bold),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      minimumSize: MaterialStateProperty.resolveWith<Size>((states) => Size(
          WidgetsBinding.instance.window.physicalSize.width * 0.015,
          WidgetsBinding.instance.window.physicalSize.height * 0.02)),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
      side: MaterialStateProperty.resolveWith<BorderSide>(
          (states) => BorderSide(color: Colors.black12)),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
      }),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.resolveWith<Size>((states) => Size(
            WidgetsBinding.instance.window.physicalSize.width * 0.01,
            WidgetsBinding.instance.window.physicalSize.height * 0.015)),
        iconSize: MaterialStateProperty.resolveWith<double>((states) =>
            WidgetsBinding.instance.window.physicalSize.width * 0.005),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => Common.blueConfigurationButton),
        foregroundColor:
            MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
        side: MaterialStateProperty.resolveWith<BorderSide>(
            (states) => BorderSide(color: Colors.white)),
        enableFeedback: false,
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45));
        }),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.resolveWith<Size>((states) => Size(
            WidgetsBinding.instance.window.physicalSize.width * 0.02,
            WidgetsBinding.instance.window.physicalSize.height * 0.03)),
        side: MaterialStateProperty.resolveWith<BorderSide>(
            (states) => BorderSide(color: Colors.black12)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => Common.blueMainButton),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
        }),
      ),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Common.background,
        titleTextStyle: TextStyle(
          fontFamily: Common.fontNameDefault,
          fontSize: Common.largeTextSize,
          color: Common.textColor,
        ))
    // cardColor: Colors.orange.shade100,
    // scaffoldBackgroundColor: Colors.yellow,
    );
