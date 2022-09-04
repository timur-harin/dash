import 'package:flutter/material.dart';
import 'package:dash/data.dart';

ThemeData commonTheme() => ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontFamily: fontNameBold, fontSize: 24, color: textColor, fontWeight: FontWeight.w800),
      displayMedium: TextStyle(fontFamily: fontNameBold, fontSize: mediumTextSize, fontWeight: FontWeight.w600, color: textColor),
      headlineLarge: TextStyle(fontFamily: fontNameLight, fontSize: 24, color: textColor, fontWeight: FontWeight.w500),
      headlineMedium: TextStyle(fontFamily: fontNameLight, fontSize: 16, color: textColor, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(fontFamily: fontNameLight, fontSize: 14, color: textColor, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontFamily: fontNameBold, fontSize: 48, color: textColor, fontWeight: FontWeight.w800),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
      side: MaterialStateProperty.resolveWith<BorderSide>((states) => const BorderSide(color: Colors.black12)),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
      }),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        // minimumSize: MaterialStateProperty.resolveWith<Size>(
        //     (states) => Size(WidgetsBinding.instance.window.physicalSize.width * 0.015, WidgetsBinding.instance.window.physicalSize.height * 0.015)),
        // iconSize: MaterialStateProperty.resolveWith<double>((states) => WidgetsBinding.instance.window.physicalSize.width * 0.005),
        enableFeedback: false,
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(borderRadius: BorderRadius.circular(45));
        }),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // minimumSize: MaterialStateProperty.resolveWith<Size>(
        //     (states) => Size((WidgetsBinding.instance.window.physicalSize.width/1920)*370, (WidgetsBinding.instance.window.physicalSize.height/1000)*90)),
        side: MaterialStateProperty.resolveWith<BorderSide>((states) => const BorderSide(color: Colors.black12)),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
        }),
      ),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: fontNameBold,
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: textColor,
        )));
