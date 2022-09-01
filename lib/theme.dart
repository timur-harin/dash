import 'package:dash/common.dart';

import 'package:flutter/material.dart';

ThemeData commonTheme() => ThemeData(
    textTheme: const TextTheme(
      headline6: TextStyle(fontFamily: fontNameBold, fontSize: 24, color: textColor, fontWeight: FontWeight.w800),
      headline4: TextStyle(fontFamily: fontNameBold, fontSize: mediumTextSize, fontWeight: FontWeight.w600, color: textColor),
      bodyText1: TextStyle(fontFamily: fontNameLight, fontSize: 24, color: textColor, fontWeight: FontWeight.w500),
      bodyText2: TextStyle(fontFamily: fontNameLight, fontSize: 16, color: textColor, fontWeight: FontWeight.w500),
      subtitle1: TextStyle(fontFamily: fontNameLight, fontSize: 14, color: textColor, fontWeight: FontWeight.w500),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      // padding: MaterialStateProperty.resolveWith<EdgeInsets>((states) => EdgeInsets.fromLTRB(5,10,5,5)),
      // minimumSize: MaterialStateProperty.resolveWith<Size>(
      //     (states) => Size(WidgetsBinding.instance.window.physicalSize.width * 0.02, WidgetsBinding.instance.window.physicalSize.height * 0.02)),
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
    // iconButtonTheme: IconButtonThemeData(
    //   style: ButtonStyle(
    //     // minimumSize: MaterialStateProperty.resolveWith<Size>(
    //     //     (states) => Size((WidgetsBinding.instance.window.physicalSize.width/1920)*370, (WidgetsBinding.instance.window.physicalSize.height/1000)*90)),
    //     side: MaterialStateProperty.resolveWith<BorderSide>((states) => BorderSide(color: Colors.black12)),
    //     shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
    //       return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
    //     }),
    //   ),
    // ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: fontNameBold,
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: textColor,
        ))
    // cardColor: Colors.orange.shade100,
    // scaffoldBackgroundColor: Colors.yellow,
    );
